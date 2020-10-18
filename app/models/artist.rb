class Artist < ActiveRecord::Base

	has_many :songs
	has_many :genres, through: :songs


	def slug
		name = self.name.gsub(" ", "-").downcase
	end


	def self.find_by_slug(slug)
		# slug = slug.split("-").map{|x| x.capitalize}.join(" ")
		# Artist.all.find_by_name(slug)
		Artist.all.find{|a| a.slug == slug}
	end

end