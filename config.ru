require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  use ArtistsController
  use SongsController
  use GenresController
  run ApplicationController

  use Rack::MethodOverride
  run ApplicationController

rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
