module Slugify

    def slug
        title = self.name
        slug = title.downcase
        slug.tr!(" ", "-")
        slug.gsub!(/[^a-zA-Z\d-]/, "")
        slug
    end
end

module FindSlug
    def find_by_slug(slug)
        self.all.select {|item| item.slug == slug}.first
    end
end