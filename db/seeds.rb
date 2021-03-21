require 'pry'
# Add seed data here. Seed your database with `rake db:seed`

# file ="Action Bronson - Larry Csonka [indie]"
# generator = file.split("-")
# parse_artists= generator[0].strip
# parse_songs= generator[1].split("[")[0].strip
# parse_genres= generator[1].split("[")[1].gsub("]", "")

# class Importer
#     attr_accessor :path

#   def initialize(path="./db/data")
#     @path = path
#   end

#   def files
#     #data_path = File.join(File.dirname(__FILE__), '..', 'db', 'data')
#     Dir.entries(@path).collect {|i| i}
#   end

#   def generator
#     files.collect do |file|
#       file.split("-")
#     end[2..-1]
#   end
  
#   def parse_artists
#     generator.collect {|compound| compound[0].strip}
#   end

#   def parse_songs
#     generator.collect do |compound|
#       compound[1].split("[")[0].strip
#     end
#   end
#   #Action Bronson - Larry Csonka [indie]
#   def parse_genres
#     generator.collect do |compound|
#       compound[1].split("[")[1].gsub("]", "")
#     end
#   end


#   def create_songs
#     parse_songs.each do |song_name|
#       Song.create(name: song_name)
#     end
#   end

#   def create_artists
#     parse_artists.each do |artist_name|
#       Arstis.create(name: artist_name)
#     end
#   end

#   def create_genres
#     parse_genres.each do |genre_name|
#       Genre.create(name: genre_name)
#     end
#   end

#   def start
#     files
#     generator
#     parse_artists
#     parse_songs
#     parse_genres
#     #create_songs
#     #create_artists
#     #create_genres
#   end

# end

# binding.pry
# new_importer= Importer.new

LibraryParser.parse