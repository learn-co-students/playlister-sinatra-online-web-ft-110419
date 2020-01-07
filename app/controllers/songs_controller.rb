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
        song.genre_ids = params[:song][:genres]
        song.save
        redirect to "/songs/#{song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        song.name = params[:song][:name]
        song.artist = Artist.find_or_create_by(:name => params[:song][:artist][:name])

        song_genres = params[:song][:genres]
        song_genres.each do |song_genre|
            Genre.find_or_create_by(:name => params[:song][:genres])

        end

        song.save
        redirect to "/songs/#{song.slug}"
    end

end