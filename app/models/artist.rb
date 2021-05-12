class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    
    def slug
        slug = self.name.tr(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        self.all.each do | sel |
            if (sel.name.tr(" ", "-").downcase == slug)
                return sel
            end
        end
    end

end