module Slugifiable
  module InstanceMethods
    
    def slug
      self.name.strip.downcase.split.join("-")
    end
  end
  
  module ClassMethods
      
    def find_by_slug(slug)
      to_find = slug.split("-").collect do |name|
      name.capitalize
    end.join(" ")
    self.find_by(name: to_find)
    end
  end
    

end