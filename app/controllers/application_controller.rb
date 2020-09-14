class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    if Song.all.length > 0
      redirect to "songs/index"
    else
      redirect to "songs/new"
    end 
    # erb :index
  end
end