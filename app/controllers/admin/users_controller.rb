module Admin 
    class UsersController < ApplicationController

        before_action :check_if_signed_in_and_is_admin

        def index
            @requests = User.where(activated:false).page params[:page]
            @all_requets_count = User.where(activated:false).length
            @all_requets_without_full_info_count = User.where(activated:false,username:nil,cv:nil).length
            @all_active_users_count = User.where(activated:true, admin:false ).length
            @all_doctors_count = @all_requets_count + @all_active_users_count
        end

        def activate
            if current_user.admin?
                @user = User.find(params[:user_id])
                @user["activated"] = true
                user_hash = {"id"=>@user["id"], "email"=>@user["email"], "username"=> @user["username"], "admin"=> @user["admin"], "activated"=> @user["activated"], "available"=> @user["available"], "cv"=> @user["cv"]}
                if @user.update(user_hash)
                    redirect_to admin_users_path
                else
                end
            else
                redirect_to root_path
            end
        end

        def doctors
            @active_users = User.where(activated:true, admin:false).page params[:page]
        end

        private

        def check_if_signed_in_and_is_admin
            if !user_signed_in? || !current_user.admin?
                redirect_to new_user_session_path, notice: "you are not authorized to access this page"
            end
        end
    end
end