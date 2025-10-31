class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_animes, through: :likes, source: :anime
  has_many :comments


  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_many :watchlists, dependent: :destroy
  has_many :watched_animes, through: :watchlists, source: :anime

  has_many :scorings, dependent: :destroy
  has_many :scored_animes, through: :scorings, source: :anime
end
