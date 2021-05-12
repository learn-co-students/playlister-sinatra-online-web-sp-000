require_relative './concerns/slugifiable.rb'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  #
  # def slug
  #   sluggy = self.name.chomp
  #   sluggy.gsub(/\s+/, "-").downcase
  # end

  # def self.find_by_slug(slug)
  #   artist_name = slug.gsub(/-/, " ")
  #   artist_obj = nil
  #   Artist.all.each do |artist|
  #     if artist.name.downcase == artist_name
  #       artist_obj = artist
  #     end
  #   end
  #   artist_obj
  # end
end
