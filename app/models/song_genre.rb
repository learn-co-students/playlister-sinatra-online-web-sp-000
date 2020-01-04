class SongGenre < ActiveRecord::Base
    belongs_to :genre 
    belongs_to :song 

    def slug
        name.parameterize
     end
 
     def self.find_by_slug(slug)
         self.all.find{|name| name.slug == slug}
     end
end