module Slugifiable
  module InstanceMethods
    def slug
      self.name.split(" ").join("-").downcase
    end
  end
  
  module ClassMethods
    def find_by_slug(slug)
      self.class.find_by(name: slug.split("-").join(" ").titlecase)
    end
  end
end