class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def index
        @users = User.all
        if !current_user.activated
            redirect_to edit_user_path(current_user)
        elsif current_user.admin
            redirect_to admin_users_path
        end
    end

    def show
    end

    def new
    end


    def edit
    end

    def update
        validate_user(user_params)
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :cv)
    end

    def validate_user(user)
        if user["username"] != "" && user["cv"].present?
            user["username"].downcase!
            if @user.update(user_params)
                redirect_to edit_user_path(current_user.id)
            else
                render :edit
            end
        else
            redirect_to edit_user_path(current_user),notice: "Please fill in everything before you continue"
        end
    end

end
