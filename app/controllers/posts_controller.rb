class PostsController < ApplicationController

    skip_before_action :set_current_user

    def index
        posts = Post.all
        if params[:user_id] != nil
            filtered_post = posts.select{|post| post[:user_id] == params[:user_id].to_i}
            render json: filtered_post
        else
            render json: posts
        end
    end 

    def show 
        post = Post.find_by(id: params[:id])
        render json: post
    end
end
