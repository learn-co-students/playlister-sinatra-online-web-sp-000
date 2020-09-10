module Slugifiable
    module ClassMethods
        def find_by_slug(name)
            self.find{|x| x.slug == name}
        end
    end


    module InstanceMethods
        def slug
            output = self.name.downcase.gsub(" ", "-")
            output.gsub(/'%$|=/,"")
        end
    end
end