class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, :through=>:songs, :source=>"genres"
    
    def slug
        self.name.downcase.gsub(/[!@%&"]/,'').tr(" ", "-")
    end

    def self.find_by_slug(search)
        # where name is slugified and matches slug
        found_artist = nil
        Artist.all.each do | a |
            if a.slug == search
                found_artist = a
            end
        end
        found_artist
    end



end