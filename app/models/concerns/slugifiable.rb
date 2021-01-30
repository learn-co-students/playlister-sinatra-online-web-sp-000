module Slugifiable
  WORD_LIST= %w(a of and the with)

  module InstanceMethods
    def slug
      org_string = self.name
      subbed_array = []

      org_string.split.each do |word|
        new_word = word.gsub("&", "%26")
        next_word = new_word.gsub("(", "%28")
        final_word = next_word.gsub(")", "%29")
        subbed_array << final_word.downcase
      end

      subbed_array.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      lowercase_array = slug.split("-")
      reset_array = []

      lowercase_array.each_with_index do |word, index|
        new_word = word.gsub("%26", "&")
        next_word = new_word.gsub("%28", "(")
        final_word = next_word.gsub("%29", ")")

        if index == 0 || !WORD_LIST.include?(final_word)
          reset_array << final_word.capitalize
        else
          reset_array << final_word
        end
      end

      name = reset_array.join(" ")
      self.find_by(name: name)
    end
  end

end
