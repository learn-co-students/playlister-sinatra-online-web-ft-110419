class GenresController < ApplicationController

    get '/genres' do 
        erb :'/genres/show'
    end
     
end