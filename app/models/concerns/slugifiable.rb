module Slugifiable

    module InstanceMethods
        def slug
            strip = self.name.downcase.split(/[.+ ]/)
            slug = strip.join("-")
            slug
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.all.find{|song| song.slug == slug }
        end
    end

end