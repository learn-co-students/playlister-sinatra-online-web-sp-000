require 'pry'
class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    # has_many :genres, through: :artist_genres
    def slug
        @slug = self.name.gsub(/ /, '-').downcase
        @slug
    end
    
    def self.find_by_slug(slug)
        self.all.each do |song|
            slugged = song.slug
            if slugged == slug
            return song
            end
        end
        
    end
end