module Slugifiable
    module InstanceMethods
        def slug
            stripped_name = self.name.downcase.split(/[.+ ]/)
            
            slug_name = stripped_name.join("-")
    
           slug_name
        end
    end
    
    module ClassMethods
        def find_by_slug(slug)
            self.all.find{|song| song.slug == slug}
        end
    end
end