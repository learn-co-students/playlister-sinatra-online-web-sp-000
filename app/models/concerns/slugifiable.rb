module Slugifiable 
   module InstanceMethods
      def slug 
         self.name.downcase.parameterize
      end 
   end 

   module ClassMethods 
      def find_by_slug(slug)
      end 
   end 
end 