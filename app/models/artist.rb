class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name = self.name.downcase
    name.gsub!(/\s/,"-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub!(/[-]/, " ")
    name = name.split(" ")
    name = name.collect do |word|
      if word != "the" && word != "with" && word != "a"
        word.capitalize!
      else
        word
      end
    end
    name = name.join(" ")
    self.find_by(name: name)
  end

end
