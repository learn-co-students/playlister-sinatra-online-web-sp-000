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
        deslug = slug.gsub(/-/, ' ').split
        deslug = deslug.map(&:capitalize)
        deslug = deslug.join(" ")
        name = self.find_by(name: deslug)
        name
    end
end