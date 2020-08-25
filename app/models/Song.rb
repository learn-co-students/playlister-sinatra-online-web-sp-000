class Song < ActiveRecord::Base
    has_many :song_genres
    has_many :genres, through: :song_genres
    belongs_to :artist

    def slug
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        # string=slug.split("-").map do |n|
        #     n.capitalize
        # end.join(" ")

        all.find {|song| song.slug==slug}
    end
end