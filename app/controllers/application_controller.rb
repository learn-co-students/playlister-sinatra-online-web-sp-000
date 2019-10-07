# require 'rack-flash'
# require 'sinatra/base'
# class ApplicationController < Sinatra::Base
#   register Sinatra::ActiveRecordExtension
#   set :session_secret, "my_application_secret"
#   set :views, Proc.new { File.join(root, "../views/") }
#
#   get '/' do
#     erb :index
#   end
# end
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end
