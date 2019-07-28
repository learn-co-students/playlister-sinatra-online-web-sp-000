module Concerns::Slugable
  def slug
    self.name.gsub(' ', '-').downcase
  end

  def find_by_slug(slug)
    self.where("lower(name) =?", slug.split('-').join(' ')).first
  end

end