class SavePostsController < ApplicationController
    skip_before_action :set_current_user

    def index
        saveposts = SavePost.all
        render json: saveposts
    end 

    def show 
        savepost = SavePost.find_by(id: params[:id])
        render json: savepost
    end

    def create
        post_to_save = Post.find_by(id: params[:post_id])
        new_savepost = SavePost.create(user_id: params[:user_id], post_id: params[:post_id], post: post_to_save)
        render json: new_savepost
    end 
end
