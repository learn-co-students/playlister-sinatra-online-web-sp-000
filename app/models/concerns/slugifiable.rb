# module Slugifiable
#     def slug
#         self.name.downcase.gsub(" ","-")
#     end

#     def self.find_by_slug(params)
#         self.all.find {|a| a.slug == "#{params[:slug]}"}
#     end

# end

module Slugifiable 
  module ClassMethods
    def self.find_by_slug(b)
        self.all.find {|a| a.slug == b}
    end
  end
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end
end