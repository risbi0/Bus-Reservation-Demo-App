class WelcomeMailer < ApplicationMailer
    def welcome_email
        @user = params[:user]
        @url = '127.0.0.1:3000/sign_in'
        mail(to: @user.email, subject: 'Welcome')
    end
end
