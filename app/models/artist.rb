class Artist < ActiveRecord::Base 
  has_many :songs
  has_many :genres, through: :songs   
  
  def slug
    @name = name.downcase
    @name.split.join("-")
  end 
  
end 