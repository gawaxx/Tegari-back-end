class SavePostsController < ApplicationController
    def index
        saveposts = SavePost.all
        render json: saveposts
    end 

    def show 
        savepost = SavePost.find_by(id: params[:id])
        render json: savepost
    end
end
