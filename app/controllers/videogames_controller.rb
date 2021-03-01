class VideogamesController < ApplicationController

    #get a list of all the videogames
  get "/videogames" do
    #get all the videogames
    @videogames = Videogame.all
    #render the view
    erb :"videogames/index"
  end

  #create an event
  get '/videogames/new' do
    erb :"videogames/new"
  end

  post '/videogames' do
    #model, create a new video game
    @videogame = Videogame.create(params)
    #response
    redirect "/videogames/#{@videogame.id}"
    # erb :"videogames/show"
  end

  #show a single videogame
  get '/videogames/:id' do
    #model
    @videogame = Videogame.find(params[:id])
    #response
    erb :"videogames/show"
  end

  get '/videogames/:id/edit' do
    #model
    @videogame = Videogame.find(params[:id])
    #response
    erb :"videogames/edit"
  end

  put '/videogames/:id' do
    #find the instance of the videogame
    videogame = Videogame.find(params[:id])
    #perform an update on the instance using params
    #make sure it saves
    videogame.update(params[:videogame])
    videogame.save
    #response
    redirect "/videogames/#{videogame.id}"
  end

  delete '/videogames/:id' do
    #model
    videogame = Videogame.find(params[:id])
    videogame.destroy
    #response
    redirect "/videogames"
  end   
end