class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.downcase.gsub(/[ ]/, "-")
    end

    def self.find_by_slug(slugname)
        spaced_slugname = slugname.gsub(/[-]/, " ")
        self.all.detect do |song|
            song.name.downcase == spaced_slugname
        end
    end
end