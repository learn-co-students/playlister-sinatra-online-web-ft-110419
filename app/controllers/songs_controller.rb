class SongsController < ApplicationController

    get '/songs' do 
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end


    # working on this method - spec 5
    post '/songs' do
        binding.pry
        artist = Artist.create(:name => params[:artist])
        song = Song.new(:name => params[:name]) 
        song.artist = artist
        # song.genres = params[:genre_ids].to_i
        song.save
        erb :'songs/#{song.slug}'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end
end