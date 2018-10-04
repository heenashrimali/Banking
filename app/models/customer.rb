class Customer < ApplicationRecord
	belongs_to :branch
	has_one :account
	validates :name, :address, :marital_status, :dob , :age, :contact_no, presence: true
	validates :age ,:contact_no ,  numericality: { only_integer: true }
	validates :contact_no,uniqueness: true,length:{is: 10}
	validates :marital_status ,inclusion: { in: %w(Married Unmarried)}
end