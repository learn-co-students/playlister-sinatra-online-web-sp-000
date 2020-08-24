module SlugModule
    module InstanceMethods
        def slug
            name.gsub(" ", "-").downcase
        end
    end

    module ClassMethods
        def self.find_by_slug(slug)
            string=slug.split("-").map do |n|
                n.capitalize
            end.join(" ")
    
            find_by(name: string)
        end
    end
end