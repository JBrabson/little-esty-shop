require 'rails_helper'

RSpec.describe 'Admin Invoices Index' do
  describe 'admin invoices index page' do
    before(:each) do
      @customer_1  = Customer.create!(first_name: 'Tanya', last_name: 'Tiger')
      @invoice_1 = @customer_1.invoices.create!(status: 0)
      @invoice_2 = @customer_1.invoices.create!(status: 1)
      @invoice_3 = @customer_1.invoices.create!(status: 1)
      @invoice_4 = @customer_1.invoices.create!(status: 2)
      @invoice_5 = @customer_1.invoices.create!(status: 0)

      @merchant_1 = Merchant.create!(name: 'Roald')
      @item_1 = @merchant_1.items.create!(name: 'Doritos', description: 'Delicious', unit_price: 100)

      InvoiceItem.create!(invoice: @invoice_1, item: @item_1, status: 0)
      InvoiceItem.create!(invoice: @invoice_2, item: @item_1, status: 1)
      InvoiceItem.create!(invoice: @invoice_3, item: @item_1, status: 1)
      InvoiceItem.create!(invoice: @invoice_4, item: @item_1, status: 2)
      InvoiceItem.create!(invoice: @invoice_5, item: @item_1, status: 1)
    end

    it 'displays all invoice ids and links to admin invoice show page' do
      visit '/admin/invoices'

      expect(page).to have_link("Invoice ##{@invoice_1.id}")
      expect(page).to have_link("Invoice ##{@invoice_2.id}")
      expect(page).to have_link("Invoice ##{@invoice_3.id}")
      expect(page).to have_link("Invoice ##{@invoice_4.id}")
      expect(page).to have_link("Invoice ##{@invoice_5.id}")

      click_on("Invoice ##{@invoice_1.id}")

      expect(current_path).to eq("/admin/invoices/#{@invoice_1.id}")
    end
  end
end
