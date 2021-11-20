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
    has_many :bookings, dependent: :delete_all
    has_many :users, through: :bookings, dependent: :delete_all

    validates :departure, :destination, :date, :time, :seats_available, :price, presence: true

    scope :by_departure, -> (departure) { where(departure: [*departure]) }
    scope :by_destination, -> (destination) { where(destination: [*destination]) }
    scope :by_date, -> (date) { where(date: [*date]) }
    scope :by_time, -> (time) { where(time: [*time]) }
    scope :sorted_by, -> (sort_option) {
        direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
        schedules = Schedule.arel_table
        case sort_option.to_s
        when /^id_/
            order(schedules[:id].send(direction))
        when /^departure_/
            order(schedules[:departure].send(direction))
        when /^destination_/
            order(schedules[:destination].send(direction))
        when /^date_/
            order(schedules[:date].send(direction))
        when /^time_/
            order(schedules[:time].send(direction))
        when /^seats_available_/
            order(schedules[:seats_available].send(direction))
        when /^price_/
            order(schedules[:price].send(direction))
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
        order(@schedule_table[var.to_sym]).where("seats_available != ? AND date > ?", 0, Date.today).distinct.pluck(var.to_sym)
    end

    def self.options_for_sorted_by
        [
            ['Departure', 'departure_asc'],
            ['Destination', 'destination_asc'],
            ['Date', 'date_asc'],
            ['Time', 'time_asc'],
            ['Available Seats', 'seats_available_desc'],
            ['Price', 'price_asc']
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
end
