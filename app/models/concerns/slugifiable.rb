module Slugifiable 
   module InstanceMethods
      def slug 
         #binding.pry
         self.name.parameterize
      end 
   end 

   module ClassMethods  
   
      def find_by_slug(slug)
        artist_name = slug.split('-').collect{|n| n.capitalize}.join(" ")
        Artist.all.find_by(name: artist_name)
      end 
   end 
end 