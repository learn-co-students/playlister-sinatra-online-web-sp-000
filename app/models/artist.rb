class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

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