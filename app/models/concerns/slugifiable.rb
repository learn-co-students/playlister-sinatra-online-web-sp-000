#note - created a slug_name field in songs, artists, genres tables
# in order to avoid reverse engineering slugged names to find objects by slug
# - Edited Library Parser
# - Added line for object.slug to specs 1, 2, 3, 4

module Concerns
  module Slug

    def slug
      @name = name
      self.slug_name = @name.downcase.gsub(/[\s]/, "-").gsub("$", "s").gsub(/[^\w-]/, "")
      self.save #saves slug_name to object
      self.slug_name #returns slug/slug_name
    end

  end

  module Deslug

    def find_by_slug(slug)
      find_by(slug_name: slug)
    end

  end
end
