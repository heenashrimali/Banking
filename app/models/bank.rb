class Bank < ApplicationRecord
  has_many :branches, dependent: :destroy
  has_many :atms, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :loans,dependent: :destroy
  validates :name, :code, presence: true
  validates :code, numericality: { only_integer: true },uniqueness: true
end