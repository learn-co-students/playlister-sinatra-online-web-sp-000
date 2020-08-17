class Song < ActiveRecord::Base
    before_create :slug
    # multiple genres
    has_many :song_genres
    has_many :genres, :through => :song_genres
    # can belong to ONE artist
    belongs_to :artist

    def slug
        self.slug = self.name.downcase.split(" ").join("-")
    end
end