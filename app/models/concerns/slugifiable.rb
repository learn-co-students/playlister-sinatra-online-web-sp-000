module Slugifiable

    module ClassMethods
        def find_by_slug(slug)
            name = slug.gsub("-", " ")
            self.find(name: name)
        end
    end

    module InstanceMethods
        def slug
            self.name.gsub(/\s/, "-")
        end
    end

end