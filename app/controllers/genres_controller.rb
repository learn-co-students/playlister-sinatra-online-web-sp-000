class GenresController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

#display all genres through instance variable genres
  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

#find_by_slug method uses slug method to retrieve a genre from the database and return that entry
    get '/genres/:slug' do
       slug = params[:slug]
       @genre = Genre.find_by_slug(slug)
       erb :"/genres/show"
     end
   end
