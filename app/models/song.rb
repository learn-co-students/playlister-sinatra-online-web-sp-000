class Song < ActiveRecord::Base

    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
      
    def slug
        @slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        @slug
    end

    def self.find_by_slug(slug)
        Song.all.find do |slug|
        slug.name
      end
    end
end
