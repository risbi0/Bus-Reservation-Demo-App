# == Schema Information
#
# Table name: seatings
# id            :integer        primary key
# one           :boolean
# two           :boolean
# ...
# forty_six     :boolean
# forty_seven   :boolean
# schedule_id   :integer        foreign key

class Seating < ApplicationRecord
    belongs_to :schedule
    has_many :bookings, through: :schedules, dependent: :delete_all

    def self.make
        Seating.create(schedule_id: Seating.count + 1, one: true, two: true, three: true, four: true, five: true, six: true, seven: true, eight: true, nine: true, ten: true,
            eleven: true, twelve: true, thirteen: true, fourteen: true, fifteen: true, sixteen: true, seventeen: true, eighteen: true, nineteen: true, twenty: true,
            twenty_one: true, twenty_two: true, twenty_three: true, twenty_four: true, twenty_five: true, twenty_six: true, twenty_seven: true, twenty_eight: true, twenty_nine: true, thirty: true,
            thirty_one: true, thirty_two: true, thirty_three: true, thirty_four: true, thirty_five: true, thirty_six: true, thirty_seven: true, thirty_eight: true, thirty_nine: true, forty: true,
            forty_one: true, forty_two: true, forty_three: true, forty_four: true, forty_five: true, forty_six: true, forty_seven: true).update_column(:id, Seating.count + 1)
    end
end
