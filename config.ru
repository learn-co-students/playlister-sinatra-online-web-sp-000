# require './config/environment'

# begin
 #  fi_check_migration

#   use Rack::MethodOverride

# rescue ActiveRecord::PendingMigrationError => err
#   STDERR.puts err
 #  exit 1
# end


# use GenresController
# use ArtistsController
# use SongsController
# run ApplicationController

require './config/environment'

#if ActiveRecord::Migrator.needs_migration?
 # raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

use Rack::MethodOverride

use GenresController
use ArtistsController
use SongsController
run ApplicationController