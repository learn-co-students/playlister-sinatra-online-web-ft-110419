class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end



  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end 

  get '/genres' do 
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/artists/:slug' do 
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end 

  get '/songs' do 
    @songs = Song.all
    erb :'songs/index'
  end 

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # @artist = @song.artist.name
    erb :'songs/show'
  end 

  get '/songs/new' do 
    erb :'/songs/new'
  end 

  post "/songs" do
    @song = Song.new(params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save
    redirect '/songs/#{@song.slug}'
  end 

end 