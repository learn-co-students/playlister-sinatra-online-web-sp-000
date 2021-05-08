class SongGenre < ActiveRecord::Base
  

  belongs_to :song
  belongs_to :genre

  #extend Slugifiable::ClassMethods
  #include Slugifiable::InstanceMethods

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end
end
