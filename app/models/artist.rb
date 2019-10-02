class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  def slug 
    slug_name = self.name.downcase.split(" ")
    slug_name.join("-")
  end

  def self.find_by_slug(slug_name)
    Artist.all.find{|artist| artist.slug == slug_name}
  end
  
end