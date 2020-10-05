require './config/environment'
require 'sinatra'

begin
  fi_check_migration
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end

use Rack::MethodOverride
use Rack::Flash
 
use GenresController
use ArtistsController
use SongsController

run ApplicationController
