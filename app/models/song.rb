class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  include ApplicationRecord

  after_initialize do |user|
    @is_updated = false
  end

  after_update do |user|
    @is_updated = true
  end

  def get_is_updated?
    @is_updated
  end
end
