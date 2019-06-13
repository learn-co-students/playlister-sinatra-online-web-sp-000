require 'sinatra/flash' 
enable :sessions

class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  

  get '/' do
    flash[:notice] = "Hooray, Flash is working!"
    erb :index
  end
end