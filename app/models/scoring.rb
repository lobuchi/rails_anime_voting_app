class Scoring < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  validates_uniqueness_of :user_id  ,scope: [:anime_id]

  enum :status, {
    Disappointed: 1,
    Poor: 2,
    Bad: 3,
    Mediocre: 4,
    Average: 5,
    Decent: 6,
    Good: 7,
    Great: 8,
    Excellent: 9,
    Masterpeice: 10
  }

end
