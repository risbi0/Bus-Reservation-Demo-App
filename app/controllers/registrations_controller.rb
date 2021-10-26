class RegistrationsController < ApplicationController
    # instantiates new user
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            WelcomeMailer.with(user: @user).welcome_email.deliver_now
            # deliver_now is provided by ActiveJob
            # stores saved user id in a session
            session[:user_id] = @user_id
            flash[:success] = 'Successfully created account. Log in to access your account'
            redirect_to root_path
        else
            flash[:danger] = 'Invalid email, email already has an account made, or all forms aren\'t filled out'
            redirect_to sign_up_path
        end
    end

    private

    def user_params
        # strong parameters
        params.require(:user).permit(:email, :firstname, :lastname,:password, :password_confirmation)
    end
end