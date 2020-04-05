module Slugifiable 
   module InstanceMethods
      def slug 
         #binding.pry
         self.name.parameterize unless self.name == nil
      end 
   end 

   module ClassMethods  
   
      def find_by_slug(slug)
         #binding.pry
        #name = slug.split('-').collect{|n| n.capitalize}.join(" ")
        self.all.find{|obj| obj.slug == slug}
      end 
   end 
end 