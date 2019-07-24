module Concerns::Slugable
  def slug
    self.name.gsub(' ', '-').downcase
  end

  def find_by_slug(slug)
    slug_name = slug.split('-')
    name = "#{slug_name[0].capitalize} #{slug_name[1].capitalize}"
    self.find_by(name: name)
  end
end