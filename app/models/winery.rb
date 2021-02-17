class Winery < ApplicationRecord
    validates :name, presence: true
    validates :city, presence: true
    validates :country, presence: true
end
