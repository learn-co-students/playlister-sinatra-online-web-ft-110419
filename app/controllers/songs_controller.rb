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
        artist = Artist.find_or_create_by(:name => params[:artist])
        song = Song.new(:name => params[:name]) 
        song.artist = artist
        song.genres = params[:genre_ids].to_i
        song.save
        # need to fix redirect link - not passing test
        redirect "/songs/#{song.slug}"
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
        @song = Song.find_by_slug(params[:slug])
        @song.name = params[:name]
        @song.artist = params[:artist]
        @song.genres = params[:genre_ids].to_i
        @song.save
        redirect "/songs/#{song.slug}"
    end

end