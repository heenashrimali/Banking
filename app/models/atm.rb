class Atm < ApplicationRecord
	belongs_to :bank
	has_many :transactions, dependent: :destroy
	validates :location , :managed_by , presence: true
end
