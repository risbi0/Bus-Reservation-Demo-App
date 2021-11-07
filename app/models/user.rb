# == Schema Information
# 
# Table name: users
#
# id            :integer        primary key
# email         :string
# firstname     :string
# lastname      :string
# password      :string
class User < ApplicationRecord
    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
    validates :email, :firstname, :lastname, presence: true
    # adds vitual attributes for authentication
    has_secure_password
    validates :password_confirmation, presence: true
end
