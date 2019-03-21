module Slugifiable
  module InstanceMethods
    def slug
      self.name.split(" ").join("-").downcase
      name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = slug.gsub("-"," ").titleize
      self.find_by(name: name)
    end
  end
end
