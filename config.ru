require './config/environment'

begin
  #Added
  use GenresController
  use ArtistsController
  use ApplicationController
  use SongsController
  #-----
  fi_check_migration

  use Rack::MethodOverride
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
