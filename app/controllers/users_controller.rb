class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :index, only: [:online_status]

    def index
        session[:user_id] = current_user.id
        @users = User.all
        if !current_user.activated
            redirect_to edit_user_path(current_user)
        elsif current_user.admin
            redirect_to admin_users_path
        end
        @all_active_users_count = User.where(activated:true, admin:false ).length
        @all_symptoms_count = Symptom.all.length
        @all_symptoms =  Symptom.all.order(created_at: :desc).page(params[:page])
        @all_conversations = Conversation.where(recipient_id: current_user.id)
        if @all_conversations.length > 0
            @all_patients_conversations = check_and_remove_unnecessary_conversations(@all_conversations)
            @all_patients = User.where(isPatient: true)
        else
            @all_patients_conversations = []
        end
    end

    def doctors
        @all_active_users = User.where(activated:true, admin:false ).page params[:page]
    end

    def conversation
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

    def destroy
        if @user.destroy
            redirect_to users_path
        else
            redirect_to users_path, notice: "user not destroyed"
        end
    end

    def online_status
        current_user[:available] = !current_user[:available]
        user_hash = {"id"=>current_user["id"], "email"=>current_user["email"], "username"=> current_user["username"], "admin"=> current_user["admin"], "activated"=> current_user["activated"], "available"=> current_user["available"], "cv"=> current_user["cv"]}
        if current_user.update(user_hash)
            if !current_user[:available]
                @all_patients_conversations.each do|conversation|
                    @all_patients.each do|patient|
                        if patient.id == conversation.sender_id
                            patient.destroy
                            conversation.destroy
                        else
                        end
                    end
                end
                redirect_to users_path
            else
                redirect_to users_path
            end
       end
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

    def check_and_remove_unnecessary_conversations(conversations)
        patients_conversations = []
        conversations.each do|conversation|
            user = User.where(id: conversation.sender_id)
            if user.present?
                if user[0]["isPatient"] == true && user[0]["activated"] == false
                    patients_conversations.push(conversation)
                else
                end
            else
            end
        end
        patients_conversations
    end

end
