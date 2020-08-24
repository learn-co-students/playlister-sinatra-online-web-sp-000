class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        name.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        string=slug.split("-").map do |n|
            n.capitalize
        end.join(" ")

        find_by(name: string)
    end

end