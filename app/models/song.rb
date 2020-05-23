class Song < ActiveRecord::Base
	belongs_to(:artist)
	has_many(:song_genres)
	has_many(:genres, through: :song_genres)

	include Slugger::Instance
	extend Slugger::Class
end