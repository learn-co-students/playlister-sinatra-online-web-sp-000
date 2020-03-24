class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    
    erb :index
  end

  get '/songs' do 
    # presents the user with list of all songs
    # as clickable links to that song's show page
  end 

  get '/genres' do 
    # presents the user with a list of all genres 
    # as clickable links to that genre's show page
  end 

  get '/artists' do 
    # presents the user with a list of all artists 
    # as clickable links to that song's show page 
  end 


end






