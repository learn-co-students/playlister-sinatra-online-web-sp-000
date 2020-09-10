class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        array = self.name.downcase.split(" ")
        slug = array.join("-")
        return slug
    end 

    def self.find_by_slug(slug)
        self.all.select{|t| t.slug == slug}.first
    end
end 