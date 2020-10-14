module Slugifiable
    
    module InstanceMethods #can sluglify its name

        def slug
            prep = self.name.downcase.split(/[.+ ]/)
            slug = prep.join("-")
            slug   
        end
    end

    module ClassMethods #given the slug, can find a song/artist/genre

        def find_by_slug(slug)
            self.all.find{|search| search.slug == slug}
        end

    end
end
