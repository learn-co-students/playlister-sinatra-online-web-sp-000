class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    split_name = self.name.split(" ")
    self.name = split_name.join("-")
    self.name.downcase!
  end

  def self.find_by_slug(slug)
    self.all.find do |o|
      split_name = o.name.split(" ")
      slugged = split_name.join("-")
      slugged.downcase!
      slugged == slug
    end
  end
end
