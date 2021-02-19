module Findable
  module ClassMethods
    def find_by_slug(slug)
      self.select{|instance| Slugifiable::ClassMethods::slugify(instance.name) == slug}.first
    end
  end
end