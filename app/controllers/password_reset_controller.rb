class PasswordResetController < ApplicationController
    def new; end

    def edit
        # finds user with a valid token
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
        rescue ActiveSupport::MessageVerifier::InvalidSignature
            flash[:danger] = 'Your token has expired. Please try again.' 
            redirect_to sign_in_path
    end

    def update
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
        if @user.update(password_params)
            flash[:success] = 'Your password was reset successfully'
            redirect_to sign_in_path
        else
            render :edit
        end
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            # PasswordMailer.with(user: @user).reset.deliver_later
        end
        flash[:info] = 'Please check your email to reset the password'
        redirect_to root_path
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end