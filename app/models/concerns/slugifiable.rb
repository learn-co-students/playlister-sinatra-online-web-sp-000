class Slugifiable
    module ClassMethods
        def find_by_slug(slug)
            @slug = slug
            result = self.where("name = ?", @slug)
        end
    end
    module InstanceMethods
        def slug
            self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end
    end
end