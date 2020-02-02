class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, :through=>:songs, :source=>"artist"
    # has_many :artists, :through=>:song_genres, :source=>"song"


    def slug
        self.name.downcase.gsub(/[!@%&"]/,'').tr(" ", "-")
    end

    def self.find_by_slug(search)
        found_genre = nil
        Genre.all.each do | g |
            if g.slug == search
                found_genre = g
            end
        end
        found_genre
    end

end

