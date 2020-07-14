require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride

  # These lines  of code automatically create the "use Controller" naming schemes based on the files in the 'controllers' directory.

  # Dir[File.join(File.dirname(__FILE__), "app/controllers", "*.rb")].collect {|file| File.basename(file).split(".")[0] }.reject {|file| file == "application_controller" }.each do |file|
  #   string_class_name = file.split('_').collect { |w| w.capitalize }.join
  #   class_name = Object.const_get(string_class_name)
  #   use class_name
  # end


  # Alternatively, define each "use Controller" explicitly as follows:

  use ArtistsController
  use GenresController
  use SongsController
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
