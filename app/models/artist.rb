class Artist < ActiveRecord::Base
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  has_many :songs
  has_many :genres, through: :songs

  # def self.find_by_slug(slug)
  #   name = slug.gsub(/-/, " ").split(" ").map{|word| word.capitalize}.join(" ")
  #   Artist.find_by(name: name)
  # end

  # def slug
  #   self.name.downcase.gsub(" ", "-")
  # end
end