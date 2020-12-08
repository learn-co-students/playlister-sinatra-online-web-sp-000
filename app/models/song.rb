class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.downcase.gsub(" ", "-")
    end

    # def self.find_by_slug(slug)
    #     name = slug.gsub("-", " ").split(" ").map(&:capitalize).join(" ")
    #     self.find_by(name: name)
    # end

    def self.find_by_slug(slug)
        self.all.find{|song| song.slug == slug}
    end
end