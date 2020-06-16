class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  #seems like slug and find_by_slug methods could be broken into a module?
  def slug
    #it strips out special characters, and replaces all spaces with -
    name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").join(" ").titlecase
    artist = Artist.find_by! name: slug
    artist
  end
end
