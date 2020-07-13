class Genre < ActiveRecord::Base
    
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    
    def slug
        
        self.name.split(" ").map do |word|
            word.downcase 
        end.join("-")
    end

    def self.find_by_slug(slug)
        @name = slug.split("-").map do |word|
            if word == "the" || word == "with" || word == "a"
                word
            else
                word.capitalize
            end
        end.join(" ")
        #binding.pry
        Genre.find_by(name: @name)
    end
end