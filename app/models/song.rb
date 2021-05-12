class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  public
  def slug
    words = self.name.split(" ")
    words = words.map { |word| word.downcase }
    words.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find { |song| song.slug == slug }
  end
end
