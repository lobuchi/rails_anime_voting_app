class AnimesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_anime, only: %i[ show edit update destroy ]

 def index
  base_query = Anime
                .left_joins(:likes)
                .group('animes.id')
  
  query_to_paginate = if params[:query].present?
                        search_term = "%#{params[:query]}%"
                        base_query.where("LOWER(animes.title) LIKE LOWER(?)", search_term)
                      else
                        base_query
                      end
  
  # Count returns a hash with GROUP BY, so get the size of that hash
    total_count = query_to_paginate.count.size
  
  # Now add the select and order for the actual records
    query_with_likes = query_to_paginate
                      .select('animes.*, COUNT(likes.id) AS likes_count')
                      .order('COUNT(likes.id) DESC')
  
    @pagy, @animes = pagy(query_with_likes, count: total_count)
  end 
  
  
  # GET /animes/1 or /animes/1.json
    def show
        if authenticated?
          @user_watchlist = current_user.watchlists.find_by(anime: @anime) || Watchlist.new      
          @user_scoring = current_user.scorings.find_by(anime: @anime) || Scoring.new
        end
    end

  # GET /animes/new
  def new
    @anime = Anime.new
  end

  # GET /animes/1/edit
  def edit
  end

  # POST /animes or /animes.json
  def create
    @anime = Anime.new(anime_params)

    respond_to do |format|
      if @anime.save
        format.html { redirect_to @anime, notice: "Anime was successfully created." }
        format.json { render :show, status: :created, location: @anime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animes/1 or /animes/1.json
  def update
    respond_to do |format|
      if @anime.update(anime_params)
        format.html { redirect_to @anime, notice: "Anime was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @anime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animes/1 or /animes/1.json
  def destroy
    @anime.destroy!

    respond_to do |format|
      format.html { redirect_to animes_path, notice: "Anime was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime
      @anime = Anime.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def anime_params
      params.require(:anime).permit(:title, :description, :featured_image, { genre_ids: [] })
    end

end
