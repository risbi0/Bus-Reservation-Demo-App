class UserValidator < ActiveModel::Validator
    def validate(record)
        record.errors.add(:name, "shoudn't contain 'admin'") if record.name.upcase.include?("ADMIN")
    end
end