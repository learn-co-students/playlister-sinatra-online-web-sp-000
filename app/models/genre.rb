class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

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