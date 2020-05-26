require './config/environment'
# require_relative 'app/controllers/application_controller'
# require_relative 'app/controllers/artists_controller'
# require_relative 'app/controllers/songs_controller'
# require_relative 'app/controllers/genres_controller'


begin
  fi_check_migration

  use Rack::MethodOverride

  use ArtistsController
  use SongsController
  use GenresController
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
