module Slugifiable
  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def find_by_slug(params_slug)
    self.find {|object| object.slug == params_slug}
  end
end


