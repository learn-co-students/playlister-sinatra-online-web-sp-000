class Song < ActiveRecord::Base
    # has_secure_password
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.gsub(" ","-").downcase
    end

    def self.find_by_slug(arg)
        # name=arg.gsub("-", " ")
        # Song.find_by name: name.titleize
        Song.all.find { |name| name.slug == arg }
        # binding.pry
        # self
    end

end