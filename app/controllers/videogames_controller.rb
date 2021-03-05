class VideogamesController < ApplicationController

  get '/videogames' do
    redirect '/login' unless logged_in?
    @user = current_user
    @videogames = Videogame.all
    erb :'videogames/index'
  end

  get '/videogames/new' do
    redirect '/login' if !logged_in?
    erb :'videogames/new'
  end

  post '/videogames' do
    videogame = current_user.videogames.new(params[:videogame])
    if videogame.title.empty? || videogame.date_purchased.empty?
      @error = "Data invalid. Please fill out both fields."
      erb :"/videogames/new"
    else
      if videogame.save
        redirect "/videogames/#{videogame.id}"
      else
        redirect '/videogames/new'
      end
    end
  end

  get '/videogames/:id' do
    redirect '/login' if !logged_in?
    @videogame = Videogame.find(params[:id])
    erb :"videogames/show"
  end

  get "/videogames/:id/edit" do
    redirect '/login' if !logged_in?
    @videogame = Videogame.find(params[:id])
    redirect '/videogames' if current_user != @videogame.user
    erb :"videogames/edit"
  end

  patch "/videogames/:id" do
    @videogame = Videogame.find(params[:id])
    if params[:videogame].include?("title" || "date_purchased")
      @videogame.update(params[:videogame])
      redirect "/videogames/#{@videogame.id}"
    else
      @error = true
      erb :"/videogames/edit"
    end
  end

  delete "/videogames/:id/delete" do
    videogame = Videogame.find_by_id(params[:id])
    if current_user == videogame.user
      if videogame && videogame.delete
        redirect "/users/#{videogame.user_id}"
      else
        redirect "/videogames/#{params[:id]}"
      end
    else
      redirect '/videogames'
    end
  end
end