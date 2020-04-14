class Song < ActiveRecord::Base
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug 
    name.parameterize
  end 

  def self.find_by_slug(slug_name)
    self.all.detect {|n| n.slug == slug_name}
  end
end 