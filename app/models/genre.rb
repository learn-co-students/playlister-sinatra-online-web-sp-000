class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
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