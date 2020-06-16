class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  
  def slug
    #it strips out special characters, and replaces all spaces with -
    self.name = self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").join(" ").titlecase
    artist = Genre.find_by! name: slug
    artist
  end
end
