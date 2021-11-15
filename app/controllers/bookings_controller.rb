class BookingsController < ApplicationController
    def new
        @schedules = Schedule.where(id: params[:book_id])
        @book = Booking.new
    end

    def create
        @book = Booking.new(booking_params)
        if @book.save
            flash[:success] = 'Booking Successful'
            redirect_to reservations_path
        else
            flash[:danger] = @book.errors.full_messages.to_sentence
            redirect_to root_path
        end
    end
    
    private

    def booking_params
        params.require(:booking).permit(:base_price,
                                        :seats,
                                        :total_price,
                                        :departure,
                                        :destination,
                                        :date_time,
                                        :name,
                                        :email,
                                        :schedules_id)
    end
end