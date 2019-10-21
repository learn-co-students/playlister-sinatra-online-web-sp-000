class Artist < ActiveRecord::Base 
  has_many :songs
  has_many :genres, through: :songs   
  
  def slug
    @name = name.downcase.split.join("-")
  end 
  
  def self.find_by_slug(name)
    new_artist = nil 
    @artists = Artist.all
    @artists.each do |artist|
      artist.slug == name ? new_artist = artist : nil 
    end 
      new_artist
  end 
  
end 