class PostsController < ApplicationController

    get '/posts' do
        "A list of video games"
    end

    get '/posts/new' do
        if !logged_in?
            redirect "/login"
        else
            "Add a new video game to the collection"
        end
    end

    get '/posts/:id/edit' do
        if !logged_in?
            redirect "/login"
        else
            "Edit a video game in the collection"
        end
    end
end