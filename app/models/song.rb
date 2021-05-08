class Song < ActiveRecord::Base
    

	belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    #extend Slugifiable::ClassMethods
    #include Slugifiable::InstanceMethods

    def slug
    name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
       Artist.all.find{|artist| artist.slug == slug}
    end
    
   end
