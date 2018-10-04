class Transaction < ApplicationRecord
	belongs_to :account
	belongs_to :atm
	belongs_to :branch
	validates :date, :operation , :amount , presence: true
	validates :amount ,  numericality: true 
	validates :operation ,inclusion: { in: %w(deposit withdrawal)}
end
