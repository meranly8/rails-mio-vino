class Wine < ApplicationRecord
    validates :name, presence: true
    validates :wine_type, presence: true
    validates :price, presence: true
    validates :price, numericality: {greater_than: 0}
    validates :year, presence: true

    belongs_to :user
    belongs_to :winery

    def self.order_by_year
        self.order(year: :desc)
    end

    def self.order_by_price
        self.order(:price)
    end

    def self.order_by_name
        self.order(:name)
    end
end
