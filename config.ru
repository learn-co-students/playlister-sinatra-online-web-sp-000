require './config/environment'
require_relative './app/controllers/application_controller.rb'
require_relative './app/controllers/songs_controller.rb'
require_relative './app/controllers/artists_controller.rb'
require_relative './app/controllers/genres_controller.rb'

begin
  fi_check_migration

  use Rack::MethodOverride
  use SongsController
  use ArtistsController
  use GenresController
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
