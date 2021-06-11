class Item < ApplicationRecord
  validates_presence_of :name, :description
  validates :unit_price, presence: true, numericality: true
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :discounts, through: :merchant

  enum status: ["enable", "disable"]
end
