
module Slugifiable

  module ClassMethod
    def find_by_slug(slug)
      self.all.find{|obj| obj.slug == slug}
    end
  end

  module InstanceMethod
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end
end
