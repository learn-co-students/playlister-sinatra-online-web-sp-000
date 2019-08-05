class SongGenre < ActiveRecord::Base
  extend Slugifiable::ClassMethod
  include Slugifiable::InstanceMethod

  belongs_to :song
  belongs_to :genre
end
