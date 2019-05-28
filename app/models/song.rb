class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  attr_accessor :genre_ids

  @genre_ids = []

  def genre_ids
    self.genres.each do |genre|
      self.genre_ids << genre.id
    end
  end
end
