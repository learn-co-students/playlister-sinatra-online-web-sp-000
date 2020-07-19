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
        split = @slug.split("-")[0]
        split.prepend("%")
        split << "%"
        @find = split
        results = self.where("name LIKE ?", @find)
        results.detect do |result|
          result.slug == @slug
        end
      end
    end
end

