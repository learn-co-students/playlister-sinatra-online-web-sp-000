module Concerns
  module Slug #=> to be included into all model classes as instance methods for populating the "slug_name" columns.

    def slug  #=> runs a method that returns the slug value for the given object
    self.name.downcase.gsub(/[\s]/, "-").gsub("$", "s").gsub(/[^\w-]/, "")
    end
  end

  module Find_by_slug #=> to be extended into all model classes as class methods for adding similar "find_by(slug) functionality.
    def find_by_slug(slug)
       self.all.find {|object| object.slug == slug} #=> runs through the object array in the given class to return the object that matches the returned 'slug' method value.
    end
  end
end
