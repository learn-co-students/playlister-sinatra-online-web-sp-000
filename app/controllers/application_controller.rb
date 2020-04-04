require 'pry'
require 'sinatra/base'
require 'sinatra/flash'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  register Sinatra::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  set :method_override, true

  get '/' do
    erb :index
  end

end
