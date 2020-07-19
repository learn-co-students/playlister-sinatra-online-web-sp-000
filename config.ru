require './config/environment'
require 'sinatra'


begin
  fi_check_migration

  use Rack::MethodOverride
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
require './app/controllers/artists_controller'
require './app/controllers/genres_controller'
require './app/controllers/songs_controller'
use GenresController
use SongsController
run ArtistsController