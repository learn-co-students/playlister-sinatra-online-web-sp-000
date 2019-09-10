module Slugable
  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-").map{|string| string.capitalize}.join(" ")
      self.find_by name: "#{name}"
    end
  end
  module InstanceMethods
    def slug
      self.name.split(" ").map{|string| string.downcase}.join("-")
    end
  end
end