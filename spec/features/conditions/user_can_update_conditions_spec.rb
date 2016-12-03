require_relative '../../spec_helper'

describe "Conditions/id/edit" do
  describe "when a user visits /conditions/id/edit" do
    it "they are able to update an existing conditon record" do
      condition = Condition.create(date: '12/01/2000', precipitation_inches: 5,
                                   max_temperature_f: 50, min_temperature_f: 20,
                                   mean_temperature_f: 35, mean_visibility: 10,
                                   mean_wind_speed_mph: 20, mean_humidity: 20)
      visit("/conditions/#{condition.id}/edit")

      within("h1") do
        expect(page).to have_content("Editing Conditions from #{condition.date}")
      end

      fill_in "condition[date]", with: "11/30/2000"
      click_on "Edit Conditions"

      expect(current_path).to eq("/conditions/#{condition.id}")

      within("h1") do
        expect(page).to have_content("Conditions for 11/30/2000")
      end
    end
  end
end
