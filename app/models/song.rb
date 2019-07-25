class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
<<<<<<< HEAD

  def slug
    name.downcase.gsub(" ", "-").delete ",", "'", '"', "@", "#"
  end

  def self.find_by_slug(name)
    self.all.find {|s| s.slug == name}
  end
end 
=======
  
  def slug
    name.downcase.gsub(" ", "-").delete ",", "'", '"', "@", "#"
  end 
  
  def self.find_by_slug(name)
    self.all.find {|s| s.slug == name}
  end 
end
>>>>>>> 9124cd55a1b9034daf5e4982762b9ec4ee70aca8
