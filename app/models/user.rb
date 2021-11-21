# == Schema Information
# 
# Table name: users
#
# id            :integer        primary key
# email         :string
# name          :string
# password      :string

class User < ApplicationRecord
    has_many :bookings, dependent: :delete_all

    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
    validates :email, :name, presence: true
    validates_with UserValidator
    has_secure_password # adds vitual attributes for authentication
    validates :password, :password_confirmation, presence: true
end
