class LikesController < ApplicationController

  def create
    @anime = Anime.find(params[:anime_id])
    @like = Like.new(anime: @anime,user: current_user)
    if @like.save
      redirect_to @anime, notice: "Upvoted!"
    else
      redirect_to @anime, alert: "You already liked this."
    end
  end

  def destroy
        @anime = Anime.find(params[:anime_id])
    @like = current_user.likes.find_by(anime: @anime)
    if @like
    @like.destroy
    notice = "Removed your vote."
    else
    notice = "You haven't liked this anime yet."
    end

       redirect_to @anime, notice: notice
  end

end
