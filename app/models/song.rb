class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    #it strips out special characters, and replaces all spaces with -
    name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").join(" ").titlecase
    song = Song.find_by(name: slug)
    song
  end

end
