module Concerns
    module Slug
        def slug
            self.name.gsub(" ", "-").downcase
        end
    end

    module Find_slug
        def find_by_slug(slug)         
            self.all.find{|obj| obj.slug == slug}
        end

    end
end