# == Schema Information
#
# Table name: bookings
#
# id                :integer        primary key
# seats             :integer
# total_price       :integer
# confirmation      :string
# status            :string
# selected_seats    :string
# user_id           :integer        foreign key
# schedule_id       :integer        foreign key

class Booking < ApplicationRecord
    belongs_to :schedule
    belongs_to :user

    before_save :ensure_confirmation
    before_save :ensure_status

    before_update :update_attr_one
    before_update :update_attr_two

    def formatted_created_at
        created_at.strftime('%m/%d/%Y %l:%M %p')
    end

    private

    def ensure_status
        self.status = 'Reserved (to be paid)'
    end

    def update_attr_one
        self.status = 'Booked'
    end

    def update_attr_two
        self.status = 'Seats Reserved'
    end

    def ensure_confirmation
        return if confirmation
    
        loop do
          self.confirmation = generate_confirmation_number
          break unless self.class.where(confirmation: confirmation).exists?
        end
    end
    
    def generate_confirmation_number(size = 10)
        charset = %w{ 1 2 3 4 5 6 7 8 9 0 A B C D E F G H J K M N P Q R T V W X Y Z }
        (0...size).map{ charset.to_a[rand(charset.size)] }.join
    end
end
