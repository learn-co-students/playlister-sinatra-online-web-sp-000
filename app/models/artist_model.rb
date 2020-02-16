class Artist < ActiveRecord::Base
  # rake db:migrate SINATRA_ENV=test
  # rspec spec/models/01_artist_spec.rb --fail-fast
  has_many :songs
  has_many :genres, :through => :songs
  
  def slug
    name.downcase.gsub(" ","-")
  end
  
  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end
end