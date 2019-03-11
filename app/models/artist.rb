class Artist < ActiveRecord::Base

  def slug
    name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Artist.all.find{ |instance| instance.slug == slug }
  end

  has_many :songs
  has_many :genres, :through => :songs

end
