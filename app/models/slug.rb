module Slug
  module InstanceMethods
    def slug
      name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      find_by(name: slug.split("-").collect { |w| w.capitalize }.join(" "))
    end
  end
end
