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
            if post = current_user.posts.find(params[:id])
                "An edit post form #{current_user.id} is editing #{post.id}" 
            else
                redirect "/posts"
            end
        end
    end
end