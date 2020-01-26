require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  require_relative 'app/controllers/songs_controller'
  require_relative 'app/controllers/artists_controller'
  require_relative 'app/controllers/genres_controller'
  use SongsController
  use GenresController
  use ArtistsController
  run ApplicationController
  
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
