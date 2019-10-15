class Song < ActiveRecord::Base 
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist 
  
  def slug 
    @name = name.downcase
    @name.split.join("-")
  end 
  
  def self.find_by_slug(title)
    @songs = Song.all 
    new_song = nil 
    
    @songs.each do |song|
      song.slug == title ? new_song = song : nil 
    end 
    new_song
  end 
  
end 