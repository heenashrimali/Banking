class Atm < ApplicationRecord
	belongs_to :bank
	has_many :transactions
	validates :location , :managed_by , presence: true
end
