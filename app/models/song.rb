class Song < ActiveRecord::Base
  extend Concerns::Slugable
  include Concerns::Slugable
  belongs_to :artist #need a foreign key(artist_id)
  has_many :song_genres
  has_many :genres, through: :song_genres


  def update_genres(new_genre_names)
    self.genres.destroy_all
   
    new_genre_names.each do |genre|
      self.genres << Genre.find_or_create_by(name: genre)
    end
  end

end

