module Slugifiable

    # def self.included base
    #     base.send :include, InstanceMethods
    #     base.extend ClassMethods
    # end

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