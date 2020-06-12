class Artist<ActiveRecord::Base
   
    
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.downcase.split.join("-")
    end

   # def Artist.find_by_slug(slug)
    #    @slug=slug.gsub('-', ' ').titlecase
     #   Artist.find_by(name: @slug)
    #end

    def Artist.find_by_slug(slug)
        artist=slug.gsub('-', ' ')
        @artist=Artist.where("name like ?", "%#{artist}%").take 
    end


end 

#results= music_library.select {|item| item.include?("Bad Blood")}
#s=results.join
#s.scan(/- (.*) \[/)
#@s=s.scan(/- (.*) \[/)
#@slug=@s.flatten.join
#Song.find_by(name: @slug)

#bad_blood=Song.find_by_id(2)
#slug=bad_blood.slug

#song=slug.gsub('-', ' ')
#Song.where("name like ?", "%#{song}%")

#Artist.where("name like ?", "%prince%")


