require './config/environment'
config.i18n.fallbacks = [I18n.default_locale]
begin
  fi_check_migration


rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end

use Rack::MethodOverride

use GenresController
use ArtistsController
use SongsController
run ApplicationController
