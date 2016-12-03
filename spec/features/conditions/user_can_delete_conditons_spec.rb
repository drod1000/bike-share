require_relative "../../spec_helper"

describe "when a user visits /conditions" do
  it "user can delete a condtion" do
    condition = Condition.create(date: '12/01/2000', precipitation_inches: 5,
                                 max_temperature_f: 50, min_temperature_f: 20,
                                 mean_temperature_f: 35, mean_visibility_miles: 10,
                                 mean_wind_speed_mph: 20, mean_humidity: 20)

    visit '/conditions'
    expect(page).to have_content("#{condition.date}")

    click_on "Delete"

    expect(current_path).to eq("/conditions")
    expect(page).to have_no_content("12/01/2000")
  end
end

describe 'when a user visits /conditions/id' do
  it 'user can delete the conditions for that id' do
    condition = Condition.create(date: '12/01/2000', precipitation_inches: 5,
                                 max_temperature_f: 50, min_temperature_f: 20,
                                 mean_temperature_f: 35, mean_visibility_miles: 10,
                                 mean_wind_speed_mph: 20, mean_humidity: 20)

    visit("/conditions/#{condition.id}")
    expect(page).to have_content("12/01/2000")
    click_on "Delete"

    expect(current_path).to eq("/conditions")
    expect(page).to have_no_content("12/01/2000")
  end
end
