class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    #it strips out special characters, and replaces all spaces with -
    name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").join(" ").titlecase
    genre = Genre.find_by! name: slug
    genre
  end
end
