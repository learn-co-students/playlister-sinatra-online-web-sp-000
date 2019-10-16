class Song < ActiveRecord::Base 
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist 
  
  def slug 
    if name 
      @name = name.downcase.split.join("-")
    end 
  end 
  
  def self.find_by_slug(title)
    @songs = Song.all 
    
    
    new_song = @songs.find do |song|
      song.slug == title 
    end 
    new_song
  end 
  
end 