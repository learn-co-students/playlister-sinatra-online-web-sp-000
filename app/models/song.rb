require_relative './concerns/slugifiable.rb'

class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def show_genres
    str = ""
    self.genres.each do |genre|
      str += ", " unless str == ""
      str += genre.name
    end
    str
  end

  def artist_name
    self.artist.name
  end

end
