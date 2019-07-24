class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs 
  
  def slug
    name.downcase.gsub(" ", "-").delete ",", "'", '"', "@", "#"
  end 
  
  def self.find_by_slug(name)
    self.all.find {|g| g.slug == name}
  end 
end