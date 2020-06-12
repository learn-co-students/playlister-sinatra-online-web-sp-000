class Song<ActiveRecord::Base
    include Slugfiable
    
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

   # def Song.find_by_slug(slug)
    #    @slug=slug.gsub('-', ' ').titlecase
     #   Song.find_by(name: @slug)
    #end

    def Song.find_by_slug(slug)
        song=slug.gsub('-', ' ')
        @song=Song.where("name like ?", "%#{song}%").take 
    end

    
end

#<%@songs.genres.each do |song|%>
 #   <p>Name:<%=song.name%>
  #  <%end%

 # slug="that-new-age-garbage"