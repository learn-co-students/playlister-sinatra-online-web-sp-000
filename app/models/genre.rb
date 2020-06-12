class Genre<ActiveRecord::Base
    include Slugfiable
    

    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    
    def Genre.find_by_slug(slug)
        if slug.include?("-")
            @slug=slug.gsub('-', ' ').titlecase 
            Genre.find_by(name: @slug)
        else
            @slug=slug
            Genre.find_by(name: @slug)
        end 
    end     
        
            
end

#genre.name
#@genres.artists.each do |genre|
 #   puts genre.name
#end 

#@genres.songs.each do |genre|
#puts genre.name
#end

#@genres.slug
#slug=@genres.slug

#slug
        #@slug=slug.gsub('-', ' ')
        #titlecase
       # Genre.find_by(name: @slug)

#if slug.include?("-")
 #   @slug=slug.gsub('-', ' ').titlecase 
  #  Genre.find_by(name: @slug)
#else
 #   @slug=slug
  #  Genre.find_by(name: @slug)
#end 


