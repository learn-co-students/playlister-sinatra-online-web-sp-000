module Slugifiable
    def find_by_slug(slug)
        all.find {|object| object.slug == slug}
    end

    def slug
        self.name.parameterize
    end
end