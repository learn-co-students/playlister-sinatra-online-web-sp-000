class Genre < ActiveRecord::Base 
  has_many :song_genres 
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs 

  def slug 
    @name = name.downcase.split.join("-")
  end 

  def self.find_by_slug(name)
    @genres = Genre.all 
    new_genre = nil 
    
    @genres.each do |genre|
      genre.slug == name ? new_genre = genre : nil 
    end 
    new_genre
  end
  
end