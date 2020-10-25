class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    
    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slugx)
        genre=Genre.all
        slugged = Genre.all.find_index do |genre|
            genre.slug == slugx
        end
        genre[slugged]
    end
end