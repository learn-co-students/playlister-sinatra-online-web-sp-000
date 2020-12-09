class Song < ActiveRecord::Base
  belong_to :artist
  has_many :song_genres
  has_many :genres,  through: :song_genres
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
