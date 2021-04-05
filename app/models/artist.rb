class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.parameterize
    end

    def self.find_by_slug(artist_name)
        self.all.detect{|artist| artist.slug == artist_name}
    end
    
end