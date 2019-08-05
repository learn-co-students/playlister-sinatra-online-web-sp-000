require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride

  use GenresController
  use ArtistsController
  use ApplicationController
  run SongsController

rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
