# I created this file - Notes from lab:

# Each class you build will need to have a method to slugify each object's name. This means you'll need to strip out any special characters, and replace all spaces with -.

# You'll need to build a method slug which takes a given song/artist/genre name and create the "slugified" version.

# The find_by_slug method should use the slug method to retrieve a song/artist/genre from the database and return that entry.

module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
    end
  end
end