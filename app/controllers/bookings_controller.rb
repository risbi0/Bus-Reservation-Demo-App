class BookingsController < ApplicationController
    before_action :require_user_logged_in!

    def new
        @schedules = Schedule.where(id: params[:book_id])
        @booking = Booking.new
    end

    def create
        @user = Booking.new(booking_params)
        if @user.save
            flash[:success] = 'Booking Successful'
            redirect_to reservations_path
        else
            flash[:danger] = @user.errors.full_messages.to_sentence
            redirect_to root_path
        end
    end
    
    private

    def booking_params
        params.require(:booking).permit(:user_id, :schedule_id, :seats, :total_price)
    end
end