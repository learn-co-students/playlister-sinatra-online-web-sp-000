class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        self.name.parameterize
    end  
  
    def self.find_by_slug(genre_name)
        self.all.detect{|genre| genre.slug == genre_name}
    end

end