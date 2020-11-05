module Slugifiable
    module InstanceMethods
        def slug
            self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            search_slug = slug.gsub('-', ' ')
            self.where("name LIKE ?", "%#{search_slug}%").first
        end
    end
end