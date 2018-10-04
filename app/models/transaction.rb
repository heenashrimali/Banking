class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :atm
  belongs_to :branch
  validates :date, :operation , :amount , presence: true
  validates :amount ,  numericality: true 
  validates :operation ,inclusion: { in: %w(deposit withdrawal)}
  validates :check_amount
  validates :withdrawal_amount_and_balance_check
  validates :withdrawal_amount
  after_save :Update_balance
  
  private
  
  def check_amount
    if self.check_amount <= 0.00 
      errors.add(:amount, "not permitted invalid amount less than zero")
    end
  end
  def withdrawal_amount_and_balance_check
    if self.operation == "withdrawal" && self.account.balance < self.amount 
      errors.add(:amount, "not permitted invalid amount balance not enough")
    end
  end
  def withdrawal_amount
    if self.amount % 100.00 == 0.00 && self.operation == "withdrawal"
      errors.add(:amount, "not permitted invalid amount not multiple of 100")
    end
  end
  def Update_balance
    if self.operation == "deposit"
      new_balance = self.account.balance + self.amount
    else
      new_balance = self.account.balance - self.amount
    end
      
    unless self.account.update_attributes(balance: new_balance)
      raise "request cannot be processed"
    end
  end
end
