class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    de_slug = slug.split("-").map {|n| n.capitalize}.join(" ")
    self.find_by_name(de_slug)
    #returns an object
  end
end