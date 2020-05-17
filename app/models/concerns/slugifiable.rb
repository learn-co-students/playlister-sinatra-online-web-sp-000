module Slugifiable
    def self.included(klass)
      klass.extend(ClassMethods)
    end
  
    module ClassMethods
      def find_by_slug(slug)
        self.find {|o| o.slug == slug}
      end
  
    end
  
    def slug
      self.name.parameterize
    end

  end