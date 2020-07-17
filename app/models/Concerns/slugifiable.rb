module Slugifiable
  module InstanceMethods

    def slug
      artist_name = self.name
      slug = artist_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find { |object| object.slug == slug }
    end
  end
end 
