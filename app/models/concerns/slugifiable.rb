module Slugifiable
    module InstanceMethods
    def slug 
    self.name.downcase.gsub(" ", "-")
    end 
end 

module ClassMethods
    def find_by_slug(slug)
        @slug = slug
        format_slug
        result = self.where("name LIKE ?", @short_slug)
        result.detect do |result|
            result.slug == @slug
        end 
    end 

    def format_slug
        slug_formatting = @slug.split("-")[0]
        slug_formatting.prepend("%")
        slug_formatting << "%"
        @short_slug = slug_formatting
        end 
    end 
end 

