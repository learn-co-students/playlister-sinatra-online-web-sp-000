class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    @artist = nil
    self.all.each do |artist|
      if artist.slug == slug
        @artist = artist
      end
    end
    @artist
  end
end
