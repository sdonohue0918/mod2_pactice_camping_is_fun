class Camper < ApplicationRecord
    has_many :signups
    has_many :activites, through: :signups
end
