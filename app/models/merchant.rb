class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items, dependent: :destroy
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :discounts

  def self.top_five_by_successful_transaction
    joins(:invoices, :transactions, :invoice_items)
    .group(:id)
    .select('merchants.*,sum(invoice_items.quantity*invoice_items.unit_price) as total_revenue')
    .where('transactions.result = ?', 0)
    .order(total_revenue: :desc)
    .limit(5)
  end

  def top_5
    items.joins(:transactions)
      .select('items.*', 'sum(invoice_items.quantity * invoice_items.unit_price) as revenue', 'transactions.result')
      .where("transactions.result = 0")
      .group('items.id', 'transactions.result')
      .order('revenue DESC')
      .limit(5)
  end

  # def top_days
  #   items.joins(:transactions)
  #     .select('items.*', 'sum(invoice_items.quantity * invoice_items.unit_price) as revenue', 'transactions.result', 'invoice_items.updated_at')
  #     .where("transactions.result = 0")
  #     .group('items.id', 'transactions.result', 'invoice_items.updated_at')
  #     .order('revenue DESC')
  #     .limit(9)
  # end

  def top_days
    items.joins(:transactions, :invoices)
      .select('items.*', 'sum(invoice_items.quantity * invoice_items.unit_price) as revenue', 'transactions.result', 'invoices.created_at')
      .where("transactions.result = 0")
      .group('items.id', 'transactions.result', 'invoices.created_at')
      .order('revenue DESC', 'invoices.created_at DESC')
      .limit(9)
  end

  def top_days_per_merchanct
    top_5.map do |item|
      top_days.find do |day|
        if day.name == item.name
          day.name
          day.created_at
        end
      end
    end
  end

  def top_5_customers
    items.joins(:transactions)
      .select('invoices.id', 'invoices.customer_id', 'transactions.result', 'count(invoices.customer_id) as count')
      .where("transactions.result = 0")
      .group('transactions.result', 'invoices.id')
      .order(count: :desc)
      .limit(5)
  end

  def ready_to_ship
    items.joins(:invoice_items, :invoices)
          .select('items.name', 'invoices.created_at', 'invoice_items.status', 'invoices.id')
          .where('invoice_items.status = 1')
          .group('items.name', 'invoices.created_at', 'invoice_items.status', 'invoices.id')
          .order('invoices.created_at')
  end

  def discounted_invoices
    items.joins(:invoice_items, :discounts)
              .select('invoice_items.invoice_id', 'invoice_items.item_id', 'items.unit_price', 'discounts.quantity_threshold', 'discounts.merchant_id', 'discounts.percentage_discount', 'discounts.quantity_threshold', 'invoice_items.quantity', 'sum(items.unit_price * invoice_items.quantity) as total_price')
              # .where('merchants.id = 1')
              .where('invoice_items.quantity >= discounts.quantity_threshold')
              .group('discounts.quantity_threshold', 'discounts.merchant_id', 'invoice_items.invoice_id', 'items.unit_price', 'invoice_items.quantity', 'invoice_items.item_id', 'discounts.percentage_discount', 'discounts.quantity_threshold', 'invoice_items.quantity')
  end
end
