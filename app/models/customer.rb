class Customer < ApplicationRecord
  belongs_to :branch
  has_one :account
  validates :name, :address, :marital_status, :date_of_birth , :age, :contact_no, presence: true
  validates :age ,:contact_no ,  numericality: { only_integer: true }
  validates :contact_no,uniqueness: true,length:{is: 10}
  validates :marital_status ,inclusion: { in: %w(Married Unmarried)}
  validate :check_age, on: [:create]

  private
  
  def check_age
    if self.age < 18 
      errors.add(:base, "not permitted to create account invalid age")
    end
  end
end