module Concerns

  module Slug #=> to be included into all model classes as instance methods for populating the "slug_name" columns.
    def slug
      @name = name #=> captures the object's name attribute for running regex on.
      self.slug_name = @name.downcase.gsub(/[\s]/, "-").gsub("$", "s").gsub(/[^\w-]/
      self.save #=> saves the slug to the object/db.
      self.slug_name #=> returns the slug_name for future use in controllers & views.
    end
  end

  module Find_by_slug #=> to be extended into all model classes as class methods for adding "find_by(slug_name) functionality.
    def find_by_slug(slug)
      self.find_by(slug_name: slug)
    end
  end
end
