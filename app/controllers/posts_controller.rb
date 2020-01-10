class PostsController < ApplicationController

    skip_before_action :set_current_user

    def index
        posts = Post.all
        render json: posts
    end 

    def show 
        post = Post.find_by(id: params[:id])
        render json: post
    end
end
