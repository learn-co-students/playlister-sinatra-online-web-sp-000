module Slugifiable
    module InstanceMethods
      def slug
        name = self.name
        slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      end
    end
  
    module ClassMethods
      def find_by_slug(slug)
        #Song.find_by_slug(given slug)
        #Genre.find_by_slug(given slug)
        self.all.each do |i|
          if i.slug === slug
            return i
          end
        end
      end
  
    end
  end