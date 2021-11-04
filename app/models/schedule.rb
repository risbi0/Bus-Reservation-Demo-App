# == Schema Information
#
# Table name: schedules
#
# id                :integer        primary key
# station           :string
# destination       :string
# date_time         :datetime
# seats_available   :integer

class Schedule < ApplicationRecord
    scope :by_departure, -> (station) { where(:station => [*station]) }
    scope :by_destination, -> (destination) { where(:destination => [*destination]) }
    scope :by_date_time, -> (date_time) { where(:date_time => [*date_time]) }
    scope :sorted_by, -> (sort_option) {
        direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
        schedules = Schedule.arel_table
        case sort_option.to_s
        when /^id_/
            order(schedules[:id].send(direction))
        when /^station_/
            order(schedules[:station].send(direction))
        when /^destination_/
            order(schedules[:destination].send(direction))
        when /^date_time_/
            order(schedules[:date_time].send(direction))
        when /^seats_available_/
            order(schedules[:seats_available].send(direction))
        else
            raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
        end
    }

    filterrific default_filter_params: { :sorted_by => 'id_asc' },
                available_filters: [
                    :by_departure,
                    :by_destination,
                    :by_date_time,
                    :sorted_by
                ]

    self.per_page = 10

    @schedule_table = Schedule.arel_table

    def self.options_for_departure
        order(@schedule_table[:station]).distinct.pluck(:station)
    end

    def self.options_for_destination
        order(@schedule_table[:destination]).distinct.pluck(:destination)
    end

    def self.options_for_date_time
        order(@schedule_table[:date_time]).distinct.pluck(:date_time)
    end

    def self.options_for_sorted_by
        [
            ['Departure', 'station_asc'],
            ['Destination', 'destination_asc'],
            ['Date and Time', 'date_time_asc'],
            ['Available Seats', 'seats_available_desc']
        ]
    end

    def formatted_date_time
        date_time.strftime('%m/%d/%Y %H:%M')
    end
end