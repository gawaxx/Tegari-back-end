class AdminsController < ApplicationController

    skip_before_action :set_current_user
    def index
        admins = Admin.all
        render json: admins
    end 

    def show 
        admin = Admin.find_by(id: params[:id])
        render json: admin
    end
end
