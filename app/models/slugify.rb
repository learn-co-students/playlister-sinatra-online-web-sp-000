class Slugify
    def self.slug(name)
        name.gsub(/\s+/, '-').downcase
    end

    def self.find_by_slug(klass, slug_input)
        klass.find_by(slug: slug_input)
    end
end