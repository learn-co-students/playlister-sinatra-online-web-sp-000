class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def self.find_by_slug(url_slug)
        self.all.find do |a|
            a.slug == url_slug
        end
    end    

    def slug
        self.name.gsub(" ", "-").scan(/[[^\s\W]-]/).join.downcase
    end
end