class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    #it seems arbitrary that Genre has_many :artists, through :songs
    #like how about has many songs thoruhg artists?!
    #i guess thats because if u draw the table charts, u'll see artist and genre is not directly connected
    #instead therse a middle man: songs. hence songs
    

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