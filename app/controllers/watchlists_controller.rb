class WatchlistsController < ApplicationController
  before_action :require_login

  def update
      @anime = Anime.find(params[:anime_id])

      @watchlist = Watchlist.find_or_initialize_by(user: current_user, anime: @anime)

      if @watchlist.update(watchlist_params)
        redirect_to @anime, notice: "Added to your #{@watchlist.status.humanize} list!"
      else
        redirect_to @anime, alert: "Could not update watchlist"
      end
  end

   def destroy
    @watchlist = current_user.watchlists.find(params[:id])
    @watchlist.destroy
    redirect_back fallback_location: root_path, notice: "Removed from your list."
  end

  private

  def watchlist_params
    params.require(:watchlist).permit(:status)
  end


end
