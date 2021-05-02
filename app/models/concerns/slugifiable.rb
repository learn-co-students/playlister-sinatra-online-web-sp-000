module Slugifiable

  def slug
    self.name.gsub(/ /, "-").downcase
  end

end


module Findable

  def find_by_slug(slug)
    self.find { |instance| instance.slug == slug }
  end

end
