class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    

    def slug
        @slug = self.name.gsub(/ /, '-').downcase
        @slug
    end

    def self.find_by_slug(slug)
        # deslug = slug.gsub(/-/, ' ').split
        # capital = deslug.map do |word|
        #     word.capitalize
        #     end 
        #     together = capital + deslug
        #     a = Artist.all.map do |word|
        #           word.name
        #         end  
        #         array = []
        #         together.map do |word|
        #             a.include?(word)
        # deslug = deslug.map(&:capitalize)
        # lower = deslug.downcase
        # deslug = deslug.join(" ")
        # name = self.find_by(name: deslug)
        # name
        # binding.pry
        # deslug = slug.gsub(/-/, ' ').split
        # deslug = deslug.map(&:capitalize)
        # deslug = deslug.join(" ")
       
        self.all.each do |song|
        slugged = song.slug
        if slugged == slug
        return song
        end
    end
        
    end
end