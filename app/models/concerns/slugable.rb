module Concerns::Slugable
  def slug
    self.name.gsub(' ', '-')
  end

  def find_by_slug(slug)
    self.find_by(name: slug.split('-').join(' '))
  end

end