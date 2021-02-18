require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  run ApplicationController

  require_relative 'app/controllers/songs_controller'
  require_relative 'app/controllers/artists_controller'
  require_relative 'app/controllers/genres_controller'
  
  run ApplicationController
  use SongsController
  use ArtistsController
  use GenresController

rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
