module Admin 
    class UsersController < ApplicationController

        before_action :check_if_signed_in_and_is_admin

        def index
            @requests = User.where(actived:false)
        end

        private
        def check_if_signed_in_and_is_admin
            if !user_signed_in? || !current_user.admin?
                redirect_to new_user_session_path, notice: "you are not authorized to access this page"
            end
        end
    end
end