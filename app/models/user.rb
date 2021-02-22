class User < ApplicationRecord
    has_secure_password

    validates :name, :email, presence: true
    validates :email, uniqueness: true

    has_many :wines, dependent: :delete_all
    has_many :wineries, through: :wines
end
