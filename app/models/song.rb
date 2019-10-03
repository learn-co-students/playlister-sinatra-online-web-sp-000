class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  def slug 
    slug_name = self.name.downcase.split(" ")
    slug_name.join("-")
  end

  def self.find_by_slug(slug_name)
    Song.all.find{|song| song.slug == slug_name}
  end
  
end