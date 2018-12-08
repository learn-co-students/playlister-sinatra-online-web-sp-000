module Slugifiable
  module InstanceMethods
    def slug
      to_slug = self.name.downcase
      to_slug.gsub!(/[.,']/, "")
      to_slug.gsub!(" ", "-")
      to_slug
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.select {|o| o.slug == slug}[0]
    end
  end
end