
require 'sinatra/flash' #this was added before flash would work
enable :sessions #this was added before flash would work

class ApplicationController < Sinatra::Base
  enable :sessions #this was added before flash would work
  register Sinatra::Flash #this was added before flash would work
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  

  get '/' do
    flash[:notice] = "Hooray, Flash is working!"
    erb :index
  end
end