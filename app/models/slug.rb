module Slug
  module InstanceMethods
    def slug
      name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      no_cap = ["with", "the", "a", "is"]
      find_by(name: slug.split("-").collect { |w|
        if no_cap.include?(w)
          w
        else
          w.capitalize
        end
      }.join(" "))
    end
  end
end
