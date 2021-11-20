class ReservationsController < ApplicationController
    def index
        @reservations = Booking.where(user_id: Current.user.id) unless Current.user.nil?
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
        redirect_to root_path
    end

    def destroy
        if params[:booking][:date] == Date.current.strftime('%Y-%m-%d')
            flash[:danger] = 'Can\'t cancel on the day of departure'
            redirect_to reservations_path
        else
            booking = Booking.find_by(id: params[:booking][:id])
            booking.destroy
            flash[:success] = 'Reservation successfully cancelled'
            redirect_to reservations_path
        end
    end

    private

    def update_params
        params.require(:booking).permit(:id)
    end
end