class Watchlist < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  
  validates_uniqueness_of :user_id, scope: [:anime_id]

  enum :status, { 
    plan_to_watch: 0,
    watching: 1, 
    completed: 2
  }
end
