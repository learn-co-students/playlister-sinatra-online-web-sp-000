class Song < ActiveRecord::Base
  belongs_to :artist #correct don't touch
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map {|n| n.capitalize}.join(" ")
    self.find_by_name(name)
  end

end