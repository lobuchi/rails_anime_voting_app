class Anime < ApplicationRecord
  has_one_attached :featured_image
    validates :title,presence: true
    validates :description, presence:  true

  has_many :anime_genres
  has_many :genres, through: :anime_genres
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :watchlists, dependent: :destroy
end
