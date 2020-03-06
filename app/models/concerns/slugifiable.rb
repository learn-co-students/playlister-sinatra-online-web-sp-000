module Slugifiable
    module InstanceMethods
        def slug
            self.name.gsub(" ", "-").downcase
        end
    end
    
    module ClassMethods
        def find_by_slug(slug)
            str = slug.gsub("-", " ")
            self.all.find_by(:name => titleize(str))
        end

        def titleize(str)
            str.capitalize!  # capitalize the first word in case it is part of the no words array
            words_no_cap = ["and", "or", "the", "over", "to", "the", "a", "but", "with"]
            phrase = str.split(" ").map {|word| 
                if words_no_cap.include?(word) 
                    word
                else
                    word.capitalize
                end
            }.join(" ") # I replaced the "end" in "end.join(" ") with "}" because it wasn't working in Ruby 2.1.1
          phrase  # returns the phrase with all the excluded words
        end
    end
end