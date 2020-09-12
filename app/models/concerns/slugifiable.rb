module Slugifiable
  
  module ClassMethods
  	def find_by_slug(slug)
      self.all.find do |song|
        self.find_by name: song.name if (song.name.parameterize == slug)
      end
  	end
  end

  module InstanceMethods
  	def slug
      name.parameterize
  	end  
  end
end