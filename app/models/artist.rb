class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(" ", "-").delete ",", "'", '"', "@", "#"
  end

  def self.find_by_slug(name)
    self.all.find {|a| a.slug == name}
  end
end 
