class Artist < ActiveRecord::Base
    before_create :slug
    
    # can have multiple songs
    has_many :songs
    belongs_to :song
    # can have multiple genres
    has_many :genres, :through => :songs
    belongs_to :genre

    def slug
        self.slug = self.name.downcase.split(" ").join("-")
    end
end