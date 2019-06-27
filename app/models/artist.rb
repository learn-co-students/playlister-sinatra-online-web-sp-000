class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  #The gsub replaces spaces with hyphens, downcase makes it lowercase.
  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.find do |instance|
      instance.slug == slug
    end
  end
end
