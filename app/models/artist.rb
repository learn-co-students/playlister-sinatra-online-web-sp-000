class Artist < ActiveRecord::Base 
  has_many :songs
  has_many :genres, through: :songs   
  
  def slug
    @name = name.downcase
    @name.split.join("-")
  end 
  
  def self.find_by_slug(slug)
    slug(name)
  end 
  
end 