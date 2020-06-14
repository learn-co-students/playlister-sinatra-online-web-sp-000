class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  def slug
    self.name.downcase.strip.gsub(' ', '-')
  end
  
  def self.find_by_slug(slug)
    self.all.detect {|e| e.name = slug.gsub('-',' ').split.collect {|e| e.capitalize}.join(" ")}
  end
  
end