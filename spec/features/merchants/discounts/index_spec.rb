require 'rails_helper'

RSpec.describe Discounts, type: :feature do
  describe "Merchant Discounts" do
    before :each do
      # @merchant_1 = Merchant.create!(name: "Regina's Ragin' Ragu")
      # @merchant_2 = Merchant.create!(name: "Mark's Money Makin' Markers")
      # @merchant_3 = Merchant.create!(name: "Caleb's California Catapults")
      # @item_1 = @merchant_1.items.create!(name: "Zesty Zucchini", description: "Yummy", unit_price: 400)
      # @item_2 = @merchant_1.items.create!(name: "Gnarly Garly", description: "Yum Yum Spicy", unit_price: 100)
      # @customer_1 = Customer.create!(first_name: "Me", last_name: "Last Name")
      #
      # @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 0)
      # InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_1.id, quantity: 1, unit_price: 400, status: "packaged")
      # InvoiceItem.create!(item_id: @item_2.id, invoice_id: @invoice_1.id, quantity: 2, unit_price: 200, status: "shipped")
    end

    #     Merchant Bulk Discounts Index
    #
    # As a merchant
    # When I visit my merchant dashboard
    # Then I see a link to view all my discounts
    # When I click this link
    # Then I am taken to my bulk discounts index page
    # Where I see all of my bulk discounts including their
    # percentage discount and quantity thresholds
    # And each bulk discount listed includes a link to its show page

    describe "" do
      it "" do
      visit "/merchants/#{@merchant_1.id}/dashboard"

      end
    end
  end
end
