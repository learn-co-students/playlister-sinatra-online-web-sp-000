class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        array = self.name.downcase.split(" ")
        slug = array.join("-")
        return slug
    end 

    def self.find_by_slug(slug)
        self.all.select{|t| t.slug == slug}.first
    end
end 

