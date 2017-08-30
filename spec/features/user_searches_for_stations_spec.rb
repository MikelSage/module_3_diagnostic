require 'rails_helper'

RSpec.feature 'User searches for for stations by zipcode' do
  scenario 'and finds the 10 closest stations in 6 mile radius' do
    VCR.use_cassette('features/search_by_zip') do
      # As a user
      # When I visit "/"
      visit '/'
      # And I fill in the search form with 80203
      fill_in 'search_box', with: '80203'
      # And I click "Locate"
      click_on 'Locate'
      # Then I should be on page "/search" with parameters visible in the url
      expect(current_path).to eq('/search')
      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      expect(page).to have_css('.result', count: 10)
      # And the stations should be limited to Electric and Propane
      expect(page).to_not have_content('BD')
      expect(page).to_not have_content('CNG')
      expect(page).to_not have_content('E85')
      expect(page).to_not have_content('HY')
      expect(page).to_not have_content('LNG')
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      within('.result_0') do
        expect(page).to have_content('UDR')
        expect(page).to have_content('800 Acoma St')
        expect(page).to have_content('ELEC')
        expect(page).to have_content('0.31 miles')
        expect(page).to have_content('24 hours daily')
      end
    end
  end
end
