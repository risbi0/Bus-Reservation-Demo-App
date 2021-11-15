class Booking < ApplicationRecord
    before_save :ensure_confirmation
    before_save :ensure_status

    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

    def formatted_date_time
        date_time.strftime('%m/%d/%Y %l:%M %p')
    end

    def formatted_date_time_for_comparison
        date_time.strftime('%Y-%m-%d')
    end

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
