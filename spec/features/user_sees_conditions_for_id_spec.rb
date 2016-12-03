require_relative '../spec_helper'

describe "Conditions/id" do
  describe "when a user visits /conditions/id" do
    it "they see a welcome message with the date" do
      Condition.create(date: '01 DEC 2000', precipitation: 5, max_temperature: 50, min_temperature: 20, mean_temperature: 35, mean_visibility: 10, mean_wind_speed: 20, mean_humidity: 20)
      # condition = Condition.find(2)
      visit('/conditions/1')
      # within("h1"){"#{condition.date}"}

      expect(page).to have_content("Conditions")
    end
  end
end
