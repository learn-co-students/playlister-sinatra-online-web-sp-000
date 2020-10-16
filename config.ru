require './config/environment'

begin
  #Added  
  use Rack::MethodOverride 
  #Form was never reaching action PATCH because this was at the bottom. 
  #The form first looks as a POST then sees the hidden fields, and the PATCH verb and updates it. If this is at the bottom it will not work.
  use GenresController
  use ArtistsController
  use ApplicationController
  use SongsController
  #-----
  fi_check_migration


  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
