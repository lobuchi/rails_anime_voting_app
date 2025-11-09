class MyListsController < ApplicationController
    before_action :require_login
  
  def index
    @watchlists = current_user.watchlists.includes(:anime).order(:status, created_at: :desc)
    @watchlists_by_status = @watchlists.group_by(&:status)
  end
end
