class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.parameterize
    end

    def self.find_by_slug(slug)
        # @new_string = slug.gsub("-"," ").titleize
        #upcase and upcase the Song.name so we're comparing the same text
        
        self.all.find {|a| a.slug == slug}
    end
end