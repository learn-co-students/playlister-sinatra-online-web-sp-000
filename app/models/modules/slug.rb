module Slug
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect {|instance| instance.slug == slug}
    end
  end

  def slug
    self.name.downcase.gsub(' ', '-')
  end
end
