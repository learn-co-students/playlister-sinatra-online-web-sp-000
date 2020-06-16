class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


  #create module for both of these methods
  def slug
    #it strips out special characters, and replaces all spaces with -
    self.name = self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").join(" ").titlecase
    artist = Artist.find_by! name: slug
    artist
  end
end
