module Slugable

  module InstanceMethods
    def slug
      name.downcase.gsub(' ', '-')
    end
  end

  module ClassMehthods
    def find_by_slug(s)
      self.all.find { |a| a.slug == s }
    end
  end

end