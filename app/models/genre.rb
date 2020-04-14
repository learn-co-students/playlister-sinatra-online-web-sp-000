class Genre < ActiveRecord::Base 
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs 

  def slug 
    name.parameterize
  end 

  def self.find_by_slug(slug_name)
    self.all.detect {|n| n.slug == slug_name}
  end
end 