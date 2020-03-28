module Slugifiable 
   module InstanceMethods
      def slug 
         #binding.pry
         self.name.downcase.parameterize
      end 
   end 

   module ClassMethods  
   
      def find_by_slug(slug)
         binding.pry 
         Artist.all.detect{|artist| artist.name == slug}
      end 
   end 
end 