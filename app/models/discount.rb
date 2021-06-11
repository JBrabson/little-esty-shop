class Discount < ApplicationRecord
  belongs_to :merchant

  # Merchant.joins(:invoice_items, :discounts)
  #           .select('invoice_items.invoice_id', 'invoice_items.item_id', 'items.unit_price', 'discounts.quantity_threshold', 'discounts.merchant_id', 'discounts.percentage_discount', 'discounts.quantity_threshold', 'invoice_items.quantity', 'sum(items.unit_price * invoice_items.quantity) as total_price')
  #           .where('merchants.id = 1')
  #           .where('invoice_items.quantity >= discounts.quantity_threshold')
  #           .group('discounts.quantity_threshold', 'discounts.merchant_id', 'invoice_items.invoice_id', 'items.unit_price', 'invoice_items.quantity', 'invoice_items.item_id', 'discounts.percentage_discount', 'discounts.quantity_threshold', 'invoice_items.quantity')

end
