class SongGenre < ActiveRecord::Base
#How would we implement the relationship of a song having many genres and genre having many songs? In order to establish a "many-to-many" relationship, we'll need a join table. You will need a SongGenre class to go along with this table in the database
    belongs_to :song
    belongs_to :genre


end