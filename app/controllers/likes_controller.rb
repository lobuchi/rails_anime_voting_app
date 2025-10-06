class LikesController < ApplicationController

  def create
    @anime = Anime.Find(params[:anime_id])
    @like = @anime.likes.build(user: :current_user)
    @like.save
  end

  def destroy
    @like = current_user.likes.find_by(anime: @anime)
    @like.destroy
  end

end
