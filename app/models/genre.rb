class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

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
