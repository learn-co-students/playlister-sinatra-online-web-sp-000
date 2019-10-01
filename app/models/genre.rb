class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
        
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