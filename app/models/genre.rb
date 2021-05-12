class Genre < ActiveRecord::Base
    # has_secure_password
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        self.name.gsub(" ","-").downcase
    end

    def self.find_by_slug(arg)
        name=arg.gsub("-", " ")
        Genre.find {|g| g.slug == arg}
        # binding.pry
        # self
    end

end