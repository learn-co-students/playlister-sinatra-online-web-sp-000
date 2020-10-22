class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    unslugged_name = slug.split("-").map do |word|
      word.capitalize
    end.join(" ")

    self.all.find_by(name: unslugged_name)
  end
end
