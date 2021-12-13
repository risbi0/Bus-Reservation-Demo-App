class ReservationsController < ApplicationController
    before_action :require_user_logged_in!

    def index
        @admin_table = Booking.where("date > ?", Date.today + 2).joins(:schedule).order(:date)
        @user_table = Booking.where(user_id: Current.user.id).where("date > ?", Date.today + 2).joins(:schedule).order(:date)
        @confirmation = Booking.new
    end
    
    def confirm
        @reservations = Booking.where(id: params[:rsrv_id])
        @confirmation = Booking.new
    end

    def update
        Booking.set_callback(:update, :before, :update_attr_one)
        Booking.find(params[:booking][:id]).update(update_params)

        schedule = Schedule.find(params[:booking][:schedule_id])
        schedule.update(seats_available: params[:booking][:seats_available].to_i - params[:booking][:seats].to_i)

        flash[:success] = 'Booking confirmed'
        redirect_to reservations_path
    end

    def destroy
        if Date.parse(params[:booking][:date]) - 2 <= Date.parse(Date.current.strftime('%Y-%m-%d'))
            flash[:danger] = 'Can\'t cancel from two days until departure'
        else
            booking = Booking.find_by(id: params[:booking][:id])
            booking.destroy
            flash[:success] = 'Reservation successfully cancelled'
        end
        redirect_to reservations_path
    end
    
    def choose
        @seatings = Seating.where(schedule_id: params[:sched_id])
        @book_seats = Seating.new
    end

    def seats
        selected_count = 0
        params[:seating].each { |k, v| selected_count += 1 if v == "false" }
        if selected_count != params[:seating][:limit].to_i
            flash[:danger] = 'Select the amount of seats booked'
            redirect_to select_seats_path(sched_id: params[:seating][:sched_id],
                                          book_id: params[:seating][:book_id],
                                          limit: params[:seating][:limit])
        else
            Seating.find(params[:seating][:sched_id]).update(seat_params)
            
            Booking.skip_callback(:save, :before, :ensure_status)
            Booking.skip_callback(:update, :before, :update_attr_one)
            Booking.find(params[:seating][:book_id]).update(selected_seats: params[:seating][:selected_seats])
            Booking.set_callback(:save, :before, :ensure_status)
            Booking.set_callback(:update, :before, :update_attr_one)

            flash[:success] = 'Successfully reserved seats'
            redirect_to reservations_path
        end
    end

    private

    def update_params
        params.require(:booking).permit(:id)
    end

    def update_params_two
        params.require(:booking).permit(:selected_seats)
    end

    def seat_params
        params.require(:seating).permit(:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten,
                                        :eleven, :twelve, :thirteen, :fourteen, :fifteen, :sixteen, :seventeen, :eighteen, :nineteen, :twenty,
                                        :twenty_one, :twenty_two, :twenty_three, :twenty_four, :twenty_five, :twenty_six, :twenty_seven, :twenty_eight, :twenty_nine, :thirty,
                                        :thirty_one, :thirty_two, :thirty_three, :thirty_four, :thirty_five, :thirty_six, :thirty_seven, :thirty_eight, :thirty_nine, :forty,
                                        :forty_one, :forty_two, :forty_three, :forty_four, :forty_five, :forty_six, :forty_seven)
    end
end