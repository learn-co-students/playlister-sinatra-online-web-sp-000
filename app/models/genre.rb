class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name = self.name.downcase
    name.gsub!(/\s/,"-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub!(/[-]/, " ")
    name = name.split(" ").collect do |word|
      word.capitalize!
    end
    name = name.join(" ")
    self.find_by(name: name)
  end

end
