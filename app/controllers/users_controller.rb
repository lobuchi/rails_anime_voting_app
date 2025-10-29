class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order(created_at: :desc)
      @pagy, @comments = pagy(@user.comments.order(created_at: :desc), items: 10)


      @recent_likes = @user.likes
                         .includes(:anime) # Eager load the anime object
                         .order(created_at: :desc)
                         .limit(10)
  end
end
