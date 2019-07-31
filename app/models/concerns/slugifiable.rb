module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end
  
  module ClassMethods
    def find_by_slug(slug)
      @artist = nil
      self.all.each do |artist|
        if artist.slug == slug
          @artist = artist
        end
      end
      @artist
    end
  end
    
  
end