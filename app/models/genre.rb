class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs  
    
    def slug
        slugify = self.name.downcase 
        slugify.gsub(" ", "-")
    end   

    def self.find_by_slug(slug)
        unslug = slug.gsub("-", " ")
        self.all.find { |genre| genre.name.downcase == unslug }
    end   
end