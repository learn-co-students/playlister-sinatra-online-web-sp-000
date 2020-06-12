module Slugfiable
    
        def slug
        self.name.downcase.split.join("-")
    end
end

   # module ClassMethods

    #def find_by_slug(slug)
     #   @slug=slug.gsub('-', ' ').titlecase
      #  find_by(name: @slug)
    #end
#end
#end 
