class SongsController < ApplicationController
	require 'rack-flash'
  get '/' do
  	@songs = Song.all
    erb :'song/index'
  end

  get '/songs' do 
  	@songs = Song.all
  	erb :'song/index'
  end

  get '/songs/new' do 
  	@genres = Genre.all
    erb :'song/new'
  end

  get '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
  	if @song
  		erb :'song/show'
  	else
  		Song.all.each do |s| 
  			puts s.name 
  		end
  	end
  end

  delete '/songs/:slug/delete' do 
  	@song = Song.find_by_slug(params[:slug])
  	@song.destroy
  	redirect '/songs'
  end

  get '/songs/:slug/edit' do
  	@genres = Genre.all
  	@song = Song.find_by_slug(params[:slug])
  	erb :'song/edit'
  end

  patch '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
  	@song.update(name: params[:song][:name])
  	@song.artist = Artist.find_or_create_by(name: params[:song][:artist])
  	params[:song][:genres].each do |genre|
		genre = Genre.find_by_name(genre)
		if !@song.genres.find(genre.id)
			@song.genres << genre 
		end
	end
	# flash[:message] = "Successfully updated song."
	if @song.save
		redirect "songs/#{@song.slug}"
	end
  end

  post '/songs' do 
	@song = Song.new(name: params[:song][:name])
	@song.artist = Artist.find_or_create_by(name: params[:song][:artist])
	params[:song][:genres].each do |genre|
		genre = Genre.find_by_name(genre)
		@song.genres << genre 
	end
	if @song.save 
		# flash[:message] = "Successfully created song."
		redirect "/songs/#{@song.slug}"
	end
  end
end