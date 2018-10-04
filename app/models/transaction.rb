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
  after_save :Update_balance_after_deposit
  after_save :left_balance_after_withdrawal
  
  private
  
  def check_amount
    if self.check_amount <= 0 
      errors.add(:amount, "not permitted invalid amount less than zero")
    end
  end
  def withdrawal_amount_and_balance_check
    if self.account.balance < self.amount && self.operation == 'withdrawal'
      errors.add(:amount, "not permitted invalid amount balance not enough")
    end
  end
  def withdrawal_amount
    if self.amount % '100' == '0' && self.operation == 'withdrawal'
      errors.add(:amount, "not permitted invalid amount not multiple of 100")
    end
  end
  def Update_balance_after_deposit
    if self.operation == 'deposit'
      new_balance = self.account.balance+self.amount
      self.account.update_attributes(balance: new_balance)
    end
  end
  def left_balance_after_withdrawal
    if self.operation == 'withdrawal'
      new_balance = self.account.balance-self.amount
      unless self.account.update_attributes(balance: new_balance)
      raise "requested amount can not be withdrawed"
    end
  end
end
