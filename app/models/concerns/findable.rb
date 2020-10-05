module Findable
    def find_by_slug(slug)
        name = slug.gsub("-", " ")
        self.all.each do |obj|
            if obj.name.downcase.strip.gsub(/[^a-zA-Z. ]/, "") == name
                return obj
            end
        end
    end
end