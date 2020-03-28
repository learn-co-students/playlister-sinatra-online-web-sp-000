module Slugifiable 
   module InstanceMethods
      def slug 
         self.name.downcase.parameterize
      end 
   end 

   module ClassMethods 
      def find_by_slug(name)
         #binding.pry 
         Artist.all.detect{|artist| artist.name == name}
      end 
   end 
end 