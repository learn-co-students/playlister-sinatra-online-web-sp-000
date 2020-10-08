class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        #apparently can't do @name. i thought activerecord gives u that. no?
        namesplittoarray  = self.name.downcase.split(" ")
        slug = namesplittoarray.join("-")
    end

    def self.find_by_slug(slug)
        self.all.find do | item |
            item.slug == slug
        end
    end
    
end