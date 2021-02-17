class Wine < ApplicationRecord
    validates :name, presence: true
    validates :wine_type, presence: true
    validates :year, presence: true
end
