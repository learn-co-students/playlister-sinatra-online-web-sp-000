module Findable
  def find_by_slug(slug)
    self.all.detect {|a|a.slug==slug}
  end
end
