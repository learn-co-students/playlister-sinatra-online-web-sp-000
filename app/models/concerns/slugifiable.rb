module Slugifiable 
    module InstanceMethods
        def slug 
            self.name.downcase.gsub(" ", "-")
        end 
    end

    module ClassMethods 
        def find_by_slug(slug) 
            # unslugged_name = slug.gsub("-", " ").titlecase
            # self.find_by(name: unslugged_name)
            self.all.detect do |element|
                element.slug == slug 
            end 
        end 
    end
end 
