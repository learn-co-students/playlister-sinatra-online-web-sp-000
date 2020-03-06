module Slugifiable
    module InstanceMethods
        def slug
            self.name.gsub(" ", "-").downcase
        end
    end
    
    module ClassMethods
        def find_by_slug(slug)
            self.all.find_by(:name => slug.gsub("-", " ").titleize)
        end
    end
end