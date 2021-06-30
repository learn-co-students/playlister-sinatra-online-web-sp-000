module Slugifiable
    module InstanceMethods
        def slug
            self.name.to_s.downcase.gsub(" ","-")
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.find{ |x| x.slug == slug}
        end
    end
end