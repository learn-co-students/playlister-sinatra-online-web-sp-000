require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end

#need MethodOverride to perform other actions such as PUT, PATCH or DELETE,
use Rack::MethodOverride
use ArtistsController
use SongsController
use GenresController
run ApplicationController
