module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end
  
  module ClassMethods
    def find_by_slug(slug)
      slug.all.find{|i| i.slug == slug}
    end
  end
end