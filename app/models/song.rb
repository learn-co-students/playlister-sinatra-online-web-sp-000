class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name = self.name.downcase
    name.gsub!(/\s/,"-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub!(/[-]/, " ")
    name = name.split(" ").collect do |word|
      if word != "the" && word != "with"
        word.capitalize!
      else
        word
      end
    end
    name = name.join(" ")
    self.find_by(name: name)
  end

end
