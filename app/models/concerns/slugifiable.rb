module Slugifiable
    module InstanceMethods
        def slug
            # if self.name.include?(" ")
                self.name.gsub(" ", "-").downcase
            # else
            #     self.name.downcase
            # end
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.all.find {|instance| instance.slug == slug}
        end
    end

end