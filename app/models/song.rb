class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    
    def slug
        self.name.downcase.gsub(/[ ]/, "-")
    end

    def self.find_by_slug(slugname)
        spaced_slugname = slugname.gsub(/[-]/, " ")
        self.all.detect do |song|
            song.name.downcase == spaced_slugname
        end
    end

end