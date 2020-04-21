module Slugifiable 

    module Slug
        def slug 
            name.downcase.gsub(' ', '-')
        end
    end

    module FindBySlug
        def find_by_slug(slug)
            upper_name = slug.gsub('-',' ').upcase
            all.each do |item| 
                if item.name.upcase == upper_name 
                    return item 
                end
            end
        end 
    end
end