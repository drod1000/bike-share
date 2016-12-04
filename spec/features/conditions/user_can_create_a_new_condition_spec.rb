require_relative '../../spec_helper'
require "pry"

describe 'When a user visits /conditions/new' do
  it 'they can create a new set of conditions' do
  visit '/conditions/new'

  within "h1" do
    expect(page).to have_content("Create New Conditions")
  end

  fill_in "condition[date]", with: "12/25/2016"
  fill_in "condition[max_temperature]", with: 50
  fill_in "condition[mean_temperature]", with: 40
  fill_in "condition[min_temperature]", with: 30
  fill_in "condition[mean_humidity]", with: 20
  fill_in "condition[mean_visibility]", with: 10
  fill_in "condition[mean_wind_speed]", with: 12
  fill_in "condition[precipitation]", with: 0

  click_on "Create Conditions!"

  condition = Condition.find_by(date: "12/25/2016")

  expect(condition).to be_valid

  expect(current_path).to eq("/conditions/#{condition.id}")
  expect(page).to have_content("Conditions for 12/25/2016")
  end
end
