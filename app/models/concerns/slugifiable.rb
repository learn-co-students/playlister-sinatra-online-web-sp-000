module Slugifiable
  module InstanceMethods
    def slug
      sluggy = self.name.chomp
      sluggy.gsub(/\s+/, "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      obj_name = slug.gsub(/-/, " ")
      obj = nil
      self.all.each do |instance|
        if instance.name.downcase == obj_name
          obj = instance
        end
      end
      obj
    end
  end
end
