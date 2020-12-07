class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        name.downcase.split(" ").join("-")
    end

    def self.find_by_slug(name)
        Artist.all.find {|s| s.slug == name}
    end
end