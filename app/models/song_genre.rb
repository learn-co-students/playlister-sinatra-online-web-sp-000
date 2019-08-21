class SongGenre < ActiveRecord::Base
  # include Slugifiable::InstanceMethods
  # extend Slugifiable::ClassMethods
  belongs_to :genre
  belongs_to :song
  
  def slug
    self.name.gsub(" ", "-").downcase
  end
  
  def self.find_by_slug(slug)
    self.all.find{ |i| i.slug == slug }
  end
end