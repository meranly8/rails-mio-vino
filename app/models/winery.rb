class Winery < ApplicationRecord
    validates :name, presence: true
    validates :region, presence: true
    validates :country, presence: true

    has_many :wines
    has_many :users, through: :wines
end
