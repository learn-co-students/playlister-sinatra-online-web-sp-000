class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug 
    array_of_name_words = self.name.split(" ")
    array_of_name_words.collect {|word| word.downcase}.join("-")
  end

  def self.find_by_slug(slug)
    array_of_name_words = slug.split("-")
    downcase_name = array_of_name_words.join(" ")
    self.all.find do |object|
      object.name.downcase == downcase_name
    end
  end
end