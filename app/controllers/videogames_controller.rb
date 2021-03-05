class VideogamesController < ApplicationController
  # READ -  Index Action (all videogames by all users)
  # make get request to '/videogames'
  get '/videogames' do
    redirect '/login' unless logged_in?
    @user = current_user
    @videogames = Videogame.all
    erb :'videogames/index'
  end

  # CREATE
  # Shows 'new videogame' form and makes a new videogame
  get '/videogames/new' do
    redirect '/login' if !logged_in?
    # problem_attr
    erb :'videogames/new'
  end

  post '/videogames' do
    videogame = current_user.videogames.new(params[:videogame])
    if videogame.title.empty? || videogame.date_purchased.empty?
      @error = "Data invalid. Please fill out both fields."
      # problem_attr
      erb :"/videogames/new"
    else
      # persist problem object to db
      if videogame.save
        #take user to problem show page
        redirect "/videogames/#{videogame.id}"
      else
        #re-render the form
        redirect '/videogames/new'
      end
    end
  end

  # READ - Show Action (one problem)
  # get request to '/problems/:id'
  get '/videogames/:id' do
    redirect '/login' if !logged_in?
    @videogame = Videogame.find(params[:id])
    erb :"videogames/show"
  end

  # UPDATE - Edit
  # make a get request to '/problems/:id/edit'
  # renders view edit_problem.erb
  get "/videogames/:id/edit" do
    redirect '/login' if !logged_in?
    @videogame = Videogame.find(params[:id])
    # User authorization - only the user who created the problem can edit it
    redirect '/videogames' if current_user != @videogame.user
    # problem_attr
    erb :"videogames/edit"
  end

  # make a patch request to '/problems/:id/''
  # find instance of the model to update,
  # using id from params, update and save instance
  patch "/videogames/:id" do
    @videogame = Videogame.find(params[:id])
    # styles must be selected
    if params[:videogame].include?("title" || "date_purchased")
      @videogame.update(params[:videogame])
      redirect "/videogames/#{@videogame.id}"
    else
      @error = true
      # problem_attr
      erb :"/videogames/edit"
    end
  end

  # DESTROY
  # make a delete request to '/problems/:id'
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

  # private
  #   def problem_attr
  #     @colors = Problem::COLORS
  #     @grades = Problem::GRADES
  #     @styles = Style.all
  #   end
end