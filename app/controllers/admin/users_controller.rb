module Admin 
    class UsersController < ApplicationController
        before_action :check_if_signed_in_and_is_admin

        def index
            @search = User.ransack(params[:q])
            @requests = @search.result.where(activated:false, admin:false, isPatient:false).page(params[:page])
            @all_requests = User.where(activated:false, admin:false, isPatient:false)
            @all_requests_without_full_info = User.where(activated:false, admin:false, isPatient:false, username:nil).or(User.where(activated:false, admin:false, isPatient:false, cv:nil))
            @all_doctors = User.where(activated:true, admin:false)
            @all_active_doctors = User.where(activated:true, admin:false, available:true)
            @all_symptoms = Symptom.all
            @all_main_symptoms = Symptom.where(main:true)
        end

        def activate
            if current_user.admin?
                @user = User.find(params[:user_id])
                @user["activated"] = true
                user_hash = {"id"=>@user["id"], "email"=>@user["email"], "username"=> @user["username"], "admin"=> @user["admin"], "activated"=> @user["activated"], "available"=> @user["available"], "cv"=> @user["cv"]}
                if @user.update(user_hash)
                    UserNotifierMailer.send_activated_email(@user).deliver
                    redirect_to admin_users_path
                else
                end
            else
                redirect_to root_path
            end
        end

        def doctors
            @all_doctors = User.where(activated:true, admin:false).page params[:page]
            @all_active_doctors = User.where(activated:true, admin:false, available:true)
        end

        private

        def check_if_signed_in_and_is_admin
            if !user_signed_in? || !current_user.admin?
                redirect_to new_user_session_path, notice: "you are not authorized to access this page"
            end
        end
    end
end