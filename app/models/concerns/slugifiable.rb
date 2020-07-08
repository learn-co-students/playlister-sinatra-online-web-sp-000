module Slugifiable
  module InstanceMethods
    def slug
      self.name.split.join("-").downcase
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-").collect {|s| s.capitalize}.join(" ").downcase
      self.all.find {|s| s.name.downcase == name}
    end
  end
end
