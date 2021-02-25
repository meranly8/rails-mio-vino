class Wine < ApplicationRecord
    belongs_to :user
    belongs_to :winery
    
    validates :name, :wine_type, :price, :year, presence: true
    validates :price, numericality: {greater_than: 0}

    def winery_attributes=(attr)
        if !attr[:name].blank?
            self.winery = Winery.find_or_create_by(name: attr[:name]) do |w|
                w.country = attr[:country]
                w.region = attr[:region]
                w.established = attr[:established]
            end
        end
    end

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
