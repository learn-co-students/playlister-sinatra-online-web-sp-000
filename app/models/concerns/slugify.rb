module Slugify
  module InstanceMethods

    def slug
      self.name.downcase.split(" ").join("-")
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      name = slug.split("-").join(" ")
      self.all.find { |obj| obj.name.downcase == name} 
    end

  end
end