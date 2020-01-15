class UsersController < ApplicationController

    skip_before_action :set_current_user

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

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            set_current_user
            render json: { user: @user, jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
            print user_params
        end
    end

    def docreate
        @user = User.create(email: user_params[:email], points: 0, password: params[:password], user_name: params[:username], name: params[:name], surname: params[:familyName], n_of_reports: 0)
    end 

    def validate_user
        if logged_in?
            render json: { user: User.new(@current_user), token: issue_token(user_id: @current_user.id) }, status: :accepted
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
