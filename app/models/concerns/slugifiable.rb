module Slugifiable

    module InstanceMethods
        def slug
            name = self.name
            slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end
    end

    module ClassMethods
    
        def find_by_slug(slug)
            found_song = ''
            self.all.each do |song|
                if song.name.parameterize == slug 
                    found_song = song
                end
            end

            found_song
        end

    end

end