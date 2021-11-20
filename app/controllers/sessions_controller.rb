class SessionsController < ApplicationController
    def new
        if Current.user
            flash[:info] = 'You are already logged in'
            redirect_to root_path
        end
    end

    def create
        user = User.find_by(email: params[:email])
        # finds existing user, checks to see if user can be authenticated
        if user.present? && user.authenticate(params[:password])
            # sets up user.id sessions
            session[:user_id] = user.id
            flash[:success] = 'Logged in successfully'
            redirect_to root_path
        else
            flash[:danger] = 'Invalid email or password'
            redirect_to sign_in_path
        end
    end

    def destroy
        #deletes user session
        session[:user_id] = nil
        flash[:success] = 'Logged Out'
        redirect_to root_path
    end
end