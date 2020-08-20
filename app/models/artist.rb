class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
  

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

