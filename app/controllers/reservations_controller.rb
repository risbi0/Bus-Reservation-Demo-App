class ReservationsController < ApplicationController
    before_action :require_user_logged_in!

    def index
        @admin_table = Booking.joins(:schedule).order(:date)
        @user_table = Booking.where(user_id: Current.user.id).joins(:schedule).order(:date)
        @confirmation = Booking.new
    end
    
    def confirm
        @reservations = Booking.where(id: params[:rsrv_id])
        @confirmation = Booking.new
    end

    def update
        confirmation = Booking.find(params[:booking][:id])
        confirmation.update(update_params)
        schedule = Schedule.find(params[:booking][:schedule_id])
        schedule.update(seats_available: params[:booking][:seats_available].to_i - params[:booking][:seats].to_i)
        flash[:success] = 'Booking confirmed'
        redirect_to reservations_path
    end

    def destroy
        if Date.parse(params[:booking][:date]) - 2 == Date.parse(Date.current.strftime('%Y-%m-%d'))
            flash[:danger] = 'Can\'t cancel from two days until departure'
        else
            booking = Booking.find_by(id: params[:booking][:id])
            booking.destroy
            flash[:success] = 'Reservation successfully cancelled'
        end
        redirect_to reservations_path
    end

    private

    def update_params
        params.require(:booking).permit(:id)
    end
end