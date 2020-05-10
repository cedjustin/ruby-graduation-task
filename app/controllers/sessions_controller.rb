class SessionsController < ApplicationController
    def index
    end

    def new
    end

    def create
        user = User.find_by(email: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to new_session_path
    end
end
