module Slugify

  module InstanceMethods

    def slug 
      name.parameterize
    end 

  end 

  module ClassMethods

    def find_by_slug
      self.all.detect {|n| n.slug == slug}
    end

  end
end 