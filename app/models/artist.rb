class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
  #  extend Slugifiable::ClassMethods
  #  include Slugifiable::InstanceMethods
   def slug
    artist_name = self.name
    slug = artist_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    #Song.find_by_slug(given slug)
    #Genre.find_by_slug(given slug)
    self.all.each do |i|
      if i.slug === slug
        return i
      end
    end
  end

 
end