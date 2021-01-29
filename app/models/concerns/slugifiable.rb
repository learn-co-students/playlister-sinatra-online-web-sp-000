module Slugifiable

  module InstanceMethods
    def slug
      org_string = self.name
      subbed_array = []

      org_string.split.each do |word|
        new_word = word.gsub("&", "%26")
        next_word = new_word.gsub("(", "%28")
        final_word = next_word.gsub(")", "%29")
        subbed_array << final_word
      end

      subbed_array.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      lowercase_array = slug.split("-")
      reset_array = []

      lowercase_array.each do |word|
        new_word = word.gsub("%26", "&")
        next_word = new_word.gsub("%28", "(")
        final_word = next_word.gsub("%29", ")")
        reset_array << final_word
      end

      name = reset_array.join(" ")
      self.find_by(name: name)
    end
  end

end
