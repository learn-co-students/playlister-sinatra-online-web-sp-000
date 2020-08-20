class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        name = self.name.downcase
        name.gsub(/\s/,'-')
     end

     def self.find_by_slug(slug)
        slug_name =  slug.gsub("-"," ")
         item  = nil
         self.all.each{|s|
         if s.name.downcase == slug_name
           item =  s
         end
     }
        item
      end
     
  end