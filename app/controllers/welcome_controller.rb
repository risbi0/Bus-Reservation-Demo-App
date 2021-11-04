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
end
