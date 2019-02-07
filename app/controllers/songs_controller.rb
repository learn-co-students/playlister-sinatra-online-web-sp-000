class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get "/songs" do
    @songs = Song.all
    erb :'songs/index'
  end

  get "/songs/new" do
    erb :'songs/new'
  end

  get "/songs/:slug/edit" do

  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post "/songs" do
    Artist.create(name: "Balls")
    redirect to "songs"
  end

end
