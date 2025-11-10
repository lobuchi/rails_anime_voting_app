class ScoringsController < ApplicationController
  before_action :require_login

   def update
      @anime = Anime.find(params[:anime_id])

      @scoring = Scoring.find_or_initialize_by(user: current_user, anime: @anime)

      if @scoring.update(scoring_params)
        redirect_to @anime, notice: "Added to your #{@scoring} list!"
      else
        redirect_to @anime, alert: "Could not update watchlist"
      end
  end

  def destroy
    @scoring = current_user.scorings.find(params[:id])
    @scoring.destroy
    redirect_back fallback_location: root_path, notice: "Removed from your list."
  end

  private

  def scoring_params
    params.require(:scoring).permit(:status)
  end

end
