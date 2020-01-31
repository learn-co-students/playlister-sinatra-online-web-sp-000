class Song < ActiveRecord::Base
    belongs_to :artist
    # belongs_to :genre - seeing what hapens if i leave this
    has_many :song_genres
    has_many :genres, through: :song_genres

   

    def slug
        self.name.downcase.gsub(/[!@%$£&"]/,'').tr(" ", "-")
    end

    def self.find_by_slug(search)
        # where name is slugified and matches slug
        found_song = nil
        Song.all.each do | s |
            if s.slug == search
                found_song = s
            end
        end
        found_song
    end

end