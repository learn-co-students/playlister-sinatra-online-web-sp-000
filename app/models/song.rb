class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        array = self.name.downcase.split(" ")
        slug = array.join("-")
        return slug
    end 

    def self.find_by_slug(slug)
        self.all.select{|t| t.slug == slug}.first
    end
end 