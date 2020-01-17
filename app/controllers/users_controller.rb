class UsersController < ApplicationController

    skip_before_action :set_current_user, only:[:create]

    def profile
        
        render json: { user: User.new(@current_user) }, status: :accepted
    end

    def index
        users = User.all
        render json: users
    end 

    def show 
        user = User.find_by(id: params[:id])
        render json: user
    end

    def pointsChange
        # byebug
        user = User.find_by(id: params[:id])
        user.update(points: user.points + 20)
    end 

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            set_current_user
            print "hey"
            render json: { jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
            print user_params
        end
    end

    def docreate
        new_user = User.create(email: user_params[:email], points: 0, password: params[:password], user_name: params[:username], name: params[:name], surname: params[:familyName], n_of_reports: 0)
        render json: new_user
    end 

    def validate_user
        if logged_in?
            render json: { user: @current_user }, status: :accepted
        else 
            render json: { error: 'invalid token' }, status: :unauthorized
        end
    end
     
    private

    def user_params
        params.require(:user).permit(:user_name, :password_digest, :email, :name, :surname, :n_of_reports, :points, :familyName)
    end

    def user_login_params
        params.require(:user).permit(:email, :password)
    end

end
