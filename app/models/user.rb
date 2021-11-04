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
    # adds vitual attributes for authentication
    has_secure_password
    # validates email
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    # validates password
    validates :password, presence: true
end
