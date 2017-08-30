require 'rails_helper'

RSpec.feature 'user visits site' do
  scenario 'and sees brand' do
    visit '/'
    expect(page).to have_content 'AltFuelFinder'
  end
end
