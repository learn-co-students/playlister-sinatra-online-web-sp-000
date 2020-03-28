module Slugifiable 
   module InstanceMethods
      def slug 
         self.name.downcase.parameterize
      end 
   end 

   module ClassMethods 
      def find_by_slug(slug)
         Artist.all.find_by {|artist| artist.name == slug}
      end 
   end 
end 