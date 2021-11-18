class ReservationsController < ApplicationController
    def confirm
        @reservations = Booking.where(id: params[:rsrv_id])
        @cancellation = Booking.new
    end

    def index
        @reservations = Booking.where(user_id: Current.user.id) unless Current.user.nil?
        @cancellation = Booking.new
    end

    def destroy
        if params[:booking][:datetime] == Date.current.strftime('%Y-%m-%d')
            flash[:danger] = "Can't cancel on the day of departure"
            redirect_to reservations_path
        else
            booking = Booking.find_by(id: params[:booking][:id])
            booking.destroy
            flash[:success] = "Reservation successfully cancelled"
            redirect_to reservations_path
        end
    end
end