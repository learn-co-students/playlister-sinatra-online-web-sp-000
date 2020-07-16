module Slugifiable
    module InstanceMethods
        def slug
            name = self.name.split()
            name.map! {|n| n.downcase}
            name = name.join("-")
            name
        end
    end

    module ClassMethods
      def find_by_slug(slug)
        @slug = slug #"taylor-swift" turn into artist name and locate artist inside the array of artists
        split = @slug.split("-")
        split.map! {|n| n.capitalize}
        name = split.join(" ") #"Taylor Swift"
        self.all.detect {|i| i.name == name}
      end
    end
end

