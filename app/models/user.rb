class User < ApplicationRecord
    has_secure_password

    validates :name, :email, presence: true
    validates :email, uniqueness: true

    has_many :wines, dependent: :delete_all
    has_many :wineries, through: :wines

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.name = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
    end
end
