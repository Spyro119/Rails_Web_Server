class Building < ApplicationRecord
    belongs_to :customer
    has_one :address , as: :entity
    has_many :building_details
    has_many :battery
    
    # def address
    #     find Building.by(id [:id]).Address
    #     [street, city, state, country].compact.join(', ')
    # end
end
