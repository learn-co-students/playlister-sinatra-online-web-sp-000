module Slugifiable
    def slug
        slug = self.name.downcase.gsub(/[^a-zA-Z. ]/, "").gsub(" ", "-")
    end
end