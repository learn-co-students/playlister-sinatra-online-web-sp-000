class SongGenre < ActiveRecord::Base
    belongs_to :song
    belongs_to :genre
end

# Make sure not to add plural to
# belongs_to
# 