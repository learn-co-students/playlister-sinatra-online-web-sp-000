class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  include Slugifiable::InstanceMethods
  
  def self.find_by_slug(slug)
    name = slug.split("-").each do |word|
      if word != "with" && word != "the"
        word.capitalize!
      end
    end
    Song.find_by(name: name.join(" "))
  end
end