class Artist < ActiveRecord::Base
<<<<<<< HEAD
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(" ", "-").delete ",", "'", '"', "@", "#"
  end

  def self.find_by_slug(name)
    self.all.find {|a| a.slug == name}
  end
end 
=======
  has_many :songs 
  has_many :genres, through: :songs
  
  def slug
    name.downcase.gsub(" ", "-").delete ",", "'", '"', "@", "#"
  end 
  
  def self.find_by_slug(name)
    self.all.find {|a| a.slug == name}
  end 
end
>>>>>>> 9124cd55a1b9034daf5e4982762b9ec4ee70aca8
