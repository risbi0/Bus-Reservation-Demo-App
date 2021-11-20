class ProfileController < ApplicationController
    before_action :require_user_logged_in!
    
    def index; end

    def destroy
        user = User.find_by(id: session[:user_id])
        user.destroy
        session[:user_id] = nil
        flash[:info] = 'Account deleted'
        redirect_to root_path
    end
end