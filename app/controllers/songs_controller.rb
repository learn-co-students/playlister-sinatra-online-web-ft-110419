class SongsController < ApplicationController
  
  use Rack::Flash
  
  get "/songs" do
    @songs = Song.all
    erb :"/songs/index"
  end
  
  post "/songs" do
    song = Song.create(name: params[:name])
    song.genre_ids = params[:genres]
    artist = Artist.find_by(name: params[:artist_name])
    if artist
      song.artist = artist
    else
      artist = Artist.create(name: params[:artist_name])
      song.artist = artist
    end
    song.save
    
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end
  
  get "/songs/new" do
    erb :"/songs/new"
  end
  
  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    erb :"songs/show"
  end
  
  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end
  
  patch "/songs/:slug" do
    song = Song.find_by_slug(params[:slug])
    song.name = params[:name] unless params[:name].empty?
    song.genre_ids = params[:genres]
    artist = Artist.find_by(name: params[:artist_name]) unless params[:artist_name].empty?
    if artist
      song.artist = artist
    else
      artist = Artist.create(name: params[:artist_name])
      song.artist = artist
    end
    song.save
    
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end
  
end
