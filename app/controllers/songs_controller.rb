class SongsController < ApplicationController

    get '/songs' do 
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    post '/songs' do
        song = Song.new(:name => params[:song][:name])
        song.artist = Artist.find_or_create_by(:name => params[:song][:artist][:name])
        song.genres << Genre.find_or_create_by(params[:song][:genres])
        song.save
        redirect to "/songs/#{song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        song.name = params[:song][:name]
        song.artist = params[:song][:artist]
        # song.genres = params[:song][:genres]
        song.save
        redirect to "/songs/#{song.slug}"
    end

end