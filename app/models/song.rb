require_relative './concerns/slugifiable.rb'

class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  include Slugable::InstanceMethods
  extend Slugable::ClassMethods
end