require './config/environment'

# if ActiveRecord::Base.connection.migration_context.needs_migration? 
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.' 
# end 
# begin
#   fi_check_migration

  use Rack::MethodOverride
  use GenresController 
  use ArtistsController 
  use SongsController
  run ApplicationController 
# rescue ActiveRecord::PendingMigrationError => err
#   STDERR.puts err
#   exit 1
# end



