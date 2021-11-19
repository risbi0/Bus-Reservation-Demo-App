class WelcomeController < ApplicationController
  def index
    (@filterrific = initialize_filterrific(
      Schedule,
      params[:filterrific],
      select_options: {
        by_departure: Schedule.options_for_departure,
        by_destination: Schedule.options_for_destination,
        by_date_time: Schedule.options_for_date_time,
        sorted_by: Schedule.options_for_sorted_by
      },
    )) || return
    @schedule = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(sched_params)
    if @schedule.save
      flash[:success] = 'Schedule created'
      redirect_to root_path
    else
      flash[:danger] = @schedule.errors.full_messages.to_sentence
      redirect_to add_schedule_path
    end
  end

  def destroy
    old_records = Schedule.where(date_time: 1.year.ago..Date.today)
    unless old_records.empty?
      old_records.destroy_all
      flash[:success] = 'Old records are destroyed'
    else
      flash[:info] = 'No old records found'
    end
    redirect_to root_path
  end

  private

  def sched_params
    params.require(:schedule).permit(:departure, :destination, :date_time, :seats_available, :price)
  end
end
