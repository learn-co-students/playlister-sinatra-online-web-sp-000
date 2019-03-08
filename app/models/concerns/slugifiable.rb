module Slugifiable

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def find_by_slug(slug)
    unslug = slug.gsub('-', ' ').split.collect!{|s| s.capitalize}.join(" ").gsub(/A\b/, "a").gsub(/An\b/, "an").gsub("The", "the").gsub("With", "with").gsub(/To\b/, "to").gsub(/And\b/, "and")
    self.find_by(:name => unslug)
  end

end
