module Slugifiable 

    module InstanceMethods

        def slug
            name.downcase.gsub(" ", "-").gsub(/[^\w-]/, '')
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            #name = slug.gsub!("-", " ")
            #name_array = name.split(" ")
            #name_array.collect! { |word| word.capitalize }
            #final_name = name_array.join(" ")
            #self.find_by(:name => final_name)
            self.all.find{|x| x.slug == slug}
        end
    end

end 