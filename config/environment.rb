ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

def fi_check_migration
  begin
    ActiveRecord::Migration.check_pending!
  rescue ActiveRecord::PendingMigrationError
    raise ActiveRecord::PendingMigrationError.new <<-EX_MSG
Migrations are pending. To resolve this issue, run:
      rake db:migrate SINATRA_ENV=test
EX_MSG
  end
end

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

module Slugger
	module Instance
		def slug
	    name.downcase.gsub(" ","-")
	  end
	end


	module Class

	  def find_by_slug(slug)
	  	# binding.pry
	    self.all.find { |obj| obj.slug == slug }
	  end
		# def find_by_slug(slug)
		# 	name_ = unslug(slug)
		# 	find_by(name: name_)
		# end

		# def unslug(slug)
		# 	slug.gsub('-', ' ')
		# end
	end
end

require 'rack-flash'

require_all 'app'
require_all 'lib'