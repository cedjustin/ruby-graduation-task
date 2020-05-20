class UserNotifierMailer < ApplicationMailer
    default :from => 'cedroced@gmail.com'

    def send_activated_email(user)
        @user = user
        mail(:to => @user.email,
        :subject => 'Your account have been activated, CRA')
    end

    def send_conversation_email(user)
        @user = user
        mail(:to => @user.email,
        :subject => 'A patient is waiting for you. CRA')
    end

end
