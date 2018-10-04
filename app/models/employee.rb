class Employee < ApplicationRecord
  belongs_to :branch
  validates :name, :address, :designation, :date_of_joining , :age, :contact_no, :salary, presence: true
  validates :age ,:contact_no ,  numericality: { only_integer: true }
  validates :contact_no,uniqueness: true,length:{is: 10}
  validates :salary ,numericality: true
  validates :designation ,inclusion: { in: %w(Manager Clerk Casher DM PO)}
  validate :check_age
  validate :check_salary

  private
  
  def check_age
    if self.age < 18 
      errors.add(:age, "not permitted invalid age")
    end
  end
  def check_salary
    if self.salary <= 0.00
      errors.add(:salary, "not permitted invalid salary less than equal to zero ")
    end
  end

end
