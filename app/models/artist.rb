class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug 
    name.parameterize
  end 

  def self.find_by_slug(slug_name)
    self.all.detect {|n| n.slug == slug_name}
  end
end