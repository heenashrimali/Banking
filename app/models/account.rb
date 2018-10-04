class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :customer
  has_many :transactions ,dependent: :destroy
  validates :type , :date_of_opening , :account_no , :balance , presence: true
  validates :balance ,  numericality: true 
  validates :account_no, numericality: { only_integer: true },uniqueness: true,length:{is: 13} 
  validates :type ,inclusion: { in: %w(Saving_Account Current_Account)}
  validate :check_balance_valid, on: [:create]
  validates :check_balance_nonzero, on: [:update]
  
  private

  def check_balance_valid
    if self.balance < 1000
      errors.add(:base, "not permitted to create account balance less than 1000")
    end
  end
  def check_balance_nonzero
    if self.balance <= 0
      errors.add(:balance, "not permitted to create account balance less than 0")
    end
  end

end

