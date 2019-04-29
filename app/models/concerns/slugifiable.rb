module Slugifiable
  def slug
    return self.name.downcase.gsub(' ','-').gsub(/[^\w-]/,'')
  end

  def find_by_slug(text)
    #given taylor-swift, finds the object with that name
    self.all.detect {|instance| instance.slug == text}
  end
end
