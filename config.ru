require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  use ArtistsController
  use Rack::MethodOverride
  use GenresController
  use Rack::MethodOverride
  use SongsController
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
