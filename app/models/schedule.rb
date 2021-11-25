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
    has_one :seating
    has_many :bookings, dependent: :delete_all
    has_many :users, through: :bookings, dependent: :delete_all

    validates :departure, :destination, :date, :time, :seats_available, :price, presence: true

    scope :by_departure, -> (departure) { where(departure: [*departure]) }
    scope :by_destination, -> (destination) { where(destination: [*destination]) }
    scope :by_date, -> (date) { where(date: [*date]) }
    scope :sorted_by, -> (sort_option) {
        direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
        schedules = Schedule.arel_table
        case sort_option.to_s
        when /^id_/
            if Current.user && Current.user.name == "ADMIN"
                order(schedules[:id].send(direction))
            else
                order(schedules[:id].send(direction)).where("seats_available != ? AND date > ?", 0, Date.today + 2)
            end
        when /^departure_/
            if Current.user && Current.user.name == "ADMIN"
                order(schedules[:departure].send(direction))
            else
                order(schedules[:departure].send(direction)).where("seats_available != ? AND date > ?", 0, Date.today + 2)
            end
        when /^destination_/
            if Current.user && Current.user.name == "ADMIN"
                order(schedules[:destination].send(direction))
            else
                order(schedules[:destination].send(direction)).where("seats_available != ? AND date > ?", 0, Date.today + 2)
            end
        when /^date_/
            if Current.user && Current.user.name == "ADMIN"
                order(schedules[:date].send(direction))
            else
                order(schedules[:date].send(direction)).where("seats_available != ? AND date > ?", 0, Date.today + 2)
            end
        when /^time_/
            if Current.user && Current.user.name == "ADMIN"
                order(schedules[:time].send(direction))
            else
                order(schedules[:time].send(direction)).where("seats_available != ? AND date > ?", 0, Date.today + 2)
            end
        when /^seats_available_/
            if Current.user && Current.user.name == "ADMIN"
                order(schedules[:seats_available].send(direction))
            else
                order(schedules[:seats_available].send(direction)).where("seats_available != ? AND date > ?", 0, Date.today + 2)
            end
        when /^price_/
            if Current.user && Current.user.name == "ADMIN"
                order(schedules[:price].send(direction))
            else
                order(schedules[:price].send(direction)).where("seats_available != ? AND date > ?", 0, Date.today + 2)
            end
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
