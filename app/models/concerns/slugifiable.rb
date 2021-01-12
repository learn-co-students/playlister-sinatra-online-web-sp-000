module Slugifiable
  module InstanceMethods
    def slug
      artist_name = self.name
      slug = artist_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/,'')
    end
  end

module ClassMethods
  def format_slug_beginning
    begin_slug = @slug.split("-")[0]
    begin_slug.prepend("%")
    begin_slug << "%"
    @short_slug = begin_slug
  end

  def find_by_slug(slug)
    @slug = slug
    format_slug_beginning
    results = self.where("name LIKE ?", @short_slug)
    results.detect do |result|
      result.slug === @slug
    end
  end
end
    
