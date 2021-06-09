class Genre < ActiveRecord::Base

    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        self.name.parameterize
    end

    def self.find_by_slug(slug)
        # @new_string = slug.gsub("-"," ").titleize
        # Genre.find_by(name: @new_string)

        self.all.find {|g| g.slug == slug}
    end
end