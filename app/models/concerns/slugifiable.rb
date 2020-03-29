module Slugifiable 
   module InstanceMethods
      def slug 
         #binding.pry
         self.name.parameterize
      end 
   end 

   module ClassMethods  
   
      def find_by_slug(slug)
        name = slug.split('-').collect{|n| n.capitalize}.join(" ")
        self.all.find_by(name: name)
      end 
   end 
end 