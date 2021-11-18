class PasswordController < ApplicationController
    # allows only logged in users
    before_action :require_user_logged_in!
    
    def edit; end

    def update
        # update user password
        if Current.user.update(password_params)
            flash[:success] = 'Password Updated'
            redirect_to profile_path
        else
            flash[:danger] = Current.user.errors.full_messages.to_sentence
            redirect_to edit_password_path
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end