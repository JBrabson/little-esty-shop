require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'has link to admin dashboard' do
      visit '/'

      expect(page).to have_link("Admin's Dashboard")

      click_on("Admin's Dashboard")

      expect(current_path).to eq('/admin')
  end

  xit 'contains all contributors, their total commits, and the total pull requests' do

    new = GithubUser.new('JBrabson', 'little-esty-shop')

    visit '/'

    expect(page).to have_content('markcyen')
    expect(page).to have_content('rcasias')
    expect(page).to have_content('JBrabson')
    expect(page).to have_content('Caleb1991')

    expect(page).to have_content(98)
    expect(page).to have_content(33)
    expect(page).to have_content(5)
    expect(page).to have_content(3)

    expect(page).to have_content(30)
  end
end
