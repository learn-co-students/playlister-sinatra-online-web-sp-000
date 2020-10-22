require "pry"

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    #takes a given song/artist/genre name and create the "slugified" version.
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    unslugged_name = slug.split("-").map do |word|
      word.capitalize
    end.join(" ")

    self.all.find_by(name: unslugged_name)
  end
end
