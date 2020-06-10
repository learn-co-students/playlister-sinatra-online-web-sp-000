class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        slugify = self.name.downcase 
        slugify.gsub(" ", "-")
        #self.name.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        unslug = slug.gsub("-", " ")
        #unslug = unslug.titleize
        self.all.find { |song| song.name.downcase == unslug }
    end    
end


