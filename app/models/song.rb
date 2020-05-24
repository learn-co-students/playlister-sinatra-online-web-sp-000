class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def self.find_by_slug(url_slug)
        self.all.find do |a|
            a.slug == url_slug
        end
    end    

    def slug
        self.name.gsub(" ", "-").scan(/[[^\s\W]-]/).join.downcase
    end
end