module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      # binding.pry
      self.all.find {|obj| obj.slug == slug }
    end
  end

  module InstanceMethods
    def slug
      self.name.gsub(' ', '-').downcase
    end
  end
end
