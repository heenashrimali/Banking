class Loan < ApplicationRecord
  belongs_to :bank
  belongs_to :customer
  validates :type , :date , :amount , :rate , :time_period , presence: true
  validates :amount , :rate , :time_period ,  numericality: true 
  validates :type ,inclusion: { in: %w(Home_Loan Car_Loan Education_Loan Personal_loan Business_loan)}
end
