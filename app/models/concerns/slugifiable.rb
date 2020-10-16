module Slugifiable

    module InstanceMethod
        def slug
            name.downcase.gsub(" ", "-")
        end
    end

    module ClassMethod
        def find_by_slug(slug)
            self.all.find {|object| object.slug == slug}
        end
    end

end