class Winery < ApplicationRecord
    validates :name, :region, :country presence: true

    has_many :wines
    has_many :users, through: :wines

    def self.order_by_established
        self.order(:established)
    end

    def self.order_by_name
        self.order(:name)
    end

    def self.order_by_region
        self.order(:region)
    end
end
