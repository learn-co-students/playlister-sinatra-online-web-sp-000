module Slugifiable
    module ClassMethods

        def find_by_slug(slug)
            if found_object = self.find_by(name: slug)
                found_object
            else
                deslugified = slug.split("-").join(" ")
                found_object = self.all.detect {|obj| obj.name.downcase == deslugified}
                found_object
            end
        end

    end
    module InstanceMethods
        def slug
            self.name.split(" ").join("-").downcase
        end
    end
end