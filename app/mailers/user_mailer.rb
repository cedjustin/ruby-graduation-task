class UserMailer < ApplicationMailer
    def sample_email(user)
        @user = user
        mail(to: @user.email, subject: "example of subject")
    end
end
