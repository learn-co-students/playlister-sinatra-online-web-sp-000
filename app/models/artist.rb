class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, :through => :songs

    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slugx)
        artist=Artist.all
        slugged = Artist.all.find_index do |artist|
            artist.slug == slugx
        end
        artist[slugged]
    end
end