class Booking < ApplicationRecord
    belongs_to :schedule
    belongs_to :user

    before_save :ensure_confirmation
    before_save :ensure_status

    def formatted_created_at
        created_at.strftime('%m/%d/%Y %l:%M %p')
    end

    private

    def ensure_status
        self.status = "Reserved (to be payed)"
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
