class Employee < ApplicationRecord
	belongs_to :branch
	validates :name, :address, :designation, :doj , :age, :contact_no, :salary, presence: true
	validates :age ,:contact_no ,  numericality: { only_integer: true }
	validates :contact_no,uniqueness: true,length:{is: 10}
	validates :salary ,numericality: true
	validates :designation ,inclusion: { in: %w(Manager Clerk Casher DM PO)}
end
