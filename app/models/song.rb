class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    #it strips out special characters, and replaces all spaces with -
    self.name = self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").join(" ").titlecase
    artist = Song.find_by! name: slug
    artist
  end

end
