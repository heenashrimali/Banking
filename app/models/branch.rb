class Branch < ApplicationRecord
	belongs_to :bank
	has_many :Employees, dependent: :destroy
	has_many :customers, dependent: :destroy
	has_many :transactions, dependent: :destroy
	validates :address, :code,:phone_no presence: true
	validates :code ,:phone_no ,  numericality: { only_integer: true },uniqueness: true
	validates :phone_no ,length: {is: 10}
end