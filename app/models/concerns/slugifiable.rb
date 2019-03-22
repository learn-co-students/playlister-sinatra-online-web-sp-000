module Slugifiable
  module InstanceMethods
    def slug
      self.name.split(" ").join("-").downcase
      name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = slug.gsub("-"," ").downcase
      song = self.all.find {|song| song.name.downcase == name}
      song
    end
  end
end
