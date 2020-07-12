module Slugifiable
    module InstanceMethods

      def slug
        self.name.downcase.gsub(" ", "-")
      end

    end

    module ClassMethods

        def find_by_slug(slug)
            self.all.find do |obj|
                obj.slug == slug
                # obj.name.downcase == slug.gsub("-", " ")
            end
            # self.find_by name: "#{slug.gsub("-", " ").titleize}"
        end

    end

end