class Transaction < ApplicationRecord
  validates_presence_of :credit_card_number
  validates :credit_card_expiration_date, presence: true, numericality: true
  validates_presence_of :result

  belongs_to :invoice
end
