class Winery < ApplicationRecord
    validates :name, presence: true
    validates :city, presence: true
    validates :country, presence: true

    has_many :wines
    has_many :users, through: :wines
end
