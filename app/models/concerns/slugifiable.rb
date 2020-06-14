module Slugifiable
  module InstanceMethods
    def slug
      name.downcase.strip.gsub(' ', '-')
    end
  end
  
  module ClassMethods  
    def find_by_slug(slug)
      all.detect {|e| e.name = slug.gsub('-',' ').split.collect {|e| e.capitalize}.join(" ")}
    end
  end
end
  