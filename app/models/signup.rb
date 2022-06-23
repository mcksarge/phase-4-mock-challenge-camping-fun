class Signup < ApplicationRecord
    belongs_to :activity
    belongs_to :camper
    validates :time, numericality: { greater_than_or_equal_to: 0 , less_than: 24}
end
