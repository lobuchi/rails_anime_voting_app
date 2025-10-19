class AnimesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_anime, only: %i[ show edit update destroy ]

  # GET /animes or /animes.json
  def index
    base_query = Anime
                  .left_joins(:likes)
                  .group(:id)
                  .select("animes.*, COUNT(likes.id) AS likes_count")
                  .order("likes_count DESC")

    if params[:query].present?
        # Apply the search condition (LOWER and LIKE) to the base query
        search_term = "%#{params[:query]}%"
        
        # Use 'where' to filter the results from the base query
        @animes = base_query.where("LOWER(title) LIKE LOWER(?)", search_term)
    else
        # When no search query is present, use the base query as is (all animes ordered by likes_count)
        @animes = base_query
    end
  
  end

  # GET /animes/1 or /animes/1.json
  def show
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
      params.expect(anime: [ :title, :description , :featured_image])
    end
end
