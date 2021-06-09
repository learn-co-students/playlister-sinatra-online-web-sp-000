class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.parameterize
    end

    def self.find_by_slug(slug)
        # @new_string = slug.gsub("-"," ").titleize
        # Song.find_by(name: @new_string)

        self.all.find {|s| s.slug == slug}
    end
end