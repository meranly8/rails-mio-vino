class Wine < ApplicationRecord
    validates :name, presence: true
    validates :wine_type, presence: true
    validates :year, presence: true

    belongs_to :user
    belongs_to :winery
end
