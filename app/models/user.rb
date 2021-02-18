class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :wines
    has_many :wineries, through: :wines
end
