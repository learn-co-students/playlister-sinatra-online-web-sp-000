module Slugify
  module InstanceMethods
    
    #FI solution
    def slug
      name.downcase.gsub(" ","-")
    end
    
    #my method
    # def slug
    #   self.name.downcase.split(" ").join("-")
    # end

  end

  module ClassMethods

    #FI solution
    def find_by_slug(slug)
      self.all.find{|artist| artist.slug == slug}
    end

    #My method
    # def find_by_slug(slug)
    #   name = slug.split("-").join(" ")
    #   self.all.find { |obj| obj.name.downcase == name} 
    # end

  end
end