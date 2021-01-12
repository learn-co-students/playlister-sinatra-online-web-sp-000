class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        slug = self.name.tr(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        self.all.each do | sel |
            if (sel.name.tr(" ", "-").downcase == slug)
                return sel
            end
        end
    end

end