# == Schema Information
#
# Table name: schedules
#
# id                :integer        primary key
# departure         :string
# destination       :string
# date              :date
# time              :time
# seats_available   :integer
# price             :integer

class Schedule < ApplicationRecord
    has_one :seating, dependent: :delete
    has_many :bookings, dependent: :delete_all
    has_many :users, through: :bookings, dependent: :delete_all

    validates :departure, :destination, :date, :time, :seats_available, :price, presence: true
    validates :time, format: { with: /\A([01]?[0-9]|2[0-3])\:[0-5][0-9]\z/ }, length: { is: 5 }

    scope :by_departure, -> (departure) { where(departure: [*departure]) }
    scope :by_destination, -> (destination) { where(destination: [*destination]) }
    scope :by_date, -> (date) { where(date: [*date]) }
    scope :sorted_by, -> (sort_option) {
        direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
        schedules = Schedule.arel_table
        case sort_option.to_s
        when /^id_/
            Schedule.arrange("id", direction, schedules)
        when /^departure_/
            Schedule.arrange("departure", direction, schedules)
        when /^destination_/
            Schedule.arrange("destination", direction, schedules)
        when /^date_/
            Schedule.arrange("date", direction, schedules)
        when /^time_/
            Schedule.arrange("time", direction, schedules)
        when /^seats_available_/
            Schedule.arrange("seats_available", direction, schedules)
        when /^price_/
            Schedule.arrange("price", direction, schedules)
        else
            raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
        end
    }

    filterrific default_filter_params: { sorted_by: 'id_asc' },
                available_filters: [
                    :by_departure,
                    :by_destination,
                    :by_date,
                    :by_time,
                    :sorted_by
                ]

    self.per_page = 10

    @schedule_table = Schedule.arel_table

    def self.options(var)
        if Current.user && Current.user.name == "ADMIN"
            order(@schedule_table[var.to_sym]).distinct.pluck(var.to_sym)
        else
            order(@schedule_table[var.to_sym]).where("seats_available != ? AND date > ?", 0, Date.today + 2).distinct.pluck(var.to_sym)
        end
    end

    def self.options_for_sorted_by
        [
            ['Departure (A - Z)', 'departure_asc'],
            ['Departure (Z- A)', 'departure_desc'],
            ['Destination (A - Z)', 'destination_asc'],
            ['Destination (Z - A)', 'destination_desc'],
            ['Date (earliest - latest)', 'date_asc'],
            ['Date (latest - earliest)', 'date_desc'],
            ['Time (earliest - latest)', 'time_asc'],
            ['Time (latest - earliest)', 'time_desc'],
            ['Available Seats (least - most)', 'seats_available_asc'],
            ['Available Seats (most - least)', 'seats_available_desc'],
            ['Price (least - most)', 'price_asc'],
            ['Price (most - least)', 'price_desc']
        ]
    end

    def formatted_date_for_comparison
        date.strftime('%Y-%m-%d')
    end

    def formatted_date
        date.strftime('%m/%d/%Y')
    end

    def formatted_time
        time.strftime('%l:%M %p')
    end

    private

    def self.arrange(col, direction, schedules)
        if Current.user && Current.user.name == "ADMIN"
            order(schedules[col.to_sym].send(direction))
        else
            order(schedules[col.to_sym].send(direction)).where("seats_available != ? AND date > ?", 0, Date.today + 2)
        end
    end
end
