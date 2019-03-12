module Slug
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end 
  end
  
  module ClassMethods 
    def find_by_slug(slug)
      name = slug.gsub("-", " ")
      self.where('lower(name) = ?', name.downcase).first
    end 
  end
end 