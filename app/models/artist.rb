class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
   artist_name = self.name
   artist_name.downcase.split(" ").join("-")
 end

 def self.find_by_slug(slug)
   artist_name = slug.split("-").map(&:capitalize).join(' ')
   artist = self.find_by(name: artist_name)
   artist
 end

end
