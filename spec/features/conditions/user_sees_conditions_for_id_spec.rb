require_relative '../../spec_helper'

describe "Conditions/id" do
  describe "when a user visits /conditions/id" do
    it "they see a welcome message with the date" do
      condition = Condition.create(date: '12/01/2000', precipitation: 5,
                                   max_temperature: 50, min_temperature: 20,
                                   mean_temperature: 35, mean_visibility: 10,
                                   mean_wind_speed: 20, mean_humidity: 20)
      visit('/conditions/1')

      within("h1") do
        expect(page).to have_content("Conditions for #{condition.date}")
      end
    end
  end
end
