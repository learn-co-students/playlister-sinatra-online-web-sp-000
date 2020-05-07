require './config/environment'

begin
  fi_check_migration
  use GenresController
  use SongsController
  use ArtistsController 
  use Rack::MethodOverride
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
