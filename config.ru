require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  use ArtistController 
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
