require 'rails_helper'

RSpec.feature 'User searches for for stations by zipcode' do
  scenario 'and finds the 10 closest stations in 6 mile radius' do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203
    fill_in 'search_box' with: '80203'
    # And I click "Locate"
    click_on 'Locate'
    # Then I should be on page "/search" with parameters visible in the url
    expect(current_path).to eq('/search')
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_css('.result', count: 10)
    expect
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  end
end
