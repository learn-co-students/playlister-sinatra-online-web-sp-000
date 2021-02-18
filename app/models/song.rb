require_relative 'slugable.rb'

class Song < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMehthods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end