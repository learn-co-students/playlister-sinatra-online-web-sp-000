class Genre < ActiveRecord::Base
    before_create :slug
    # multiple songs
    has_many :song_genres
    has_many :songs, :through => :song_genres
    # multiple artists
    has_many :artists, :through => :songs
    belongs_to :artist

    def slug
        self.slug = self.name.downcase.split(" ").join("-")
    end
end