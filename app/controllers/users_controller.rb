class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order(created_at: :desc)
  end
end
