 class Slugifiable
    
    def slug
      self.name.downcase.gsub(" ", "-")
    end
    

  
    def find_by_slug(slug)
      # is there a better way to do this?
      self.all.detect {|i| i.name.parameterize == slug}
    
    end
end