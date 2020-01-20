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

    def docreate
        new_savepost = SavePost.create(user_id: params[:user_id], post_id: params[:post_id])
        render json: new_savepost
    end 
end
