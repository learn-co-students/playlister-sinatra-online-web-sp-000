class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    
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
        Song.find_by(name: @name)
    end
end