class GenresController < ApplicationController

    configure do
        enable :sessions
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "auth_demo_lv"
      end
    

    get '/genres' do 
        @genres = Genre.all
        erb :'/genres/index'
    end

    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])
        erb :'/genres/show'
    end
end