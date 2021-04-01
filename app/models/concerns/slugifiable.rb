module Slugifiable

    module InstanceMethods
        def slug
            name = self.name
            slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end
    end

end