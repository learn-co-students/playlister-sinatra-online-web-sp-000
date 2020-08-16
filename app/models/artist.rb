# can have multiple songs
# can have multiple genres
class Artist < ActiveRecord::Base
    has_many :songs
    

end