class Account < ApplicationRecord
	belongs_to :bank
	belongs_to :customer
	has_many :transactions ,dependent: :destroy
	validates :type , :doo , :account_no , :balance , presence: true
	validates :balance ,  numericality: true 
	validates :account_no, numericality: { only_integer: true },uniqueness: true,length:{is: 13} 
	validates :type ,inclusion: { in: %w(Saving_Account Current_Account)}
end

