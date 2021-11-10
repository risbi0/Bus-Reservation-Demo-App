class BookingsController < ApplicationController
    def new
        @books = Schedule.where(id: params[:book_id])
    end
end