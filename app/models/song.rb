class Song < ActiveRecord::Base
     belongs_to :artist
     has_many :song_genres
     has_many :genres, through: :song_genres

     def slug
      name = self.name.downcase
      name.gsub(/\s/,'-')
   end

   def self.find_by_slug(slug)
      slug_name =  slug.gsub("-"," ")
       item = nil
       self.all.each{|s|
       if s.name.downcase == slug_name
         item =  s
       end
   }
      item
    end
  end