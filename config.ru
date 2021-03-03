require './config/environment'
require 'bundler/setup'

begin
  fi_check_migration

  run ApplicationController
  use Rack::MethodOverride
  use SongsController
  use ArtistsController
  use GenresController

rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
