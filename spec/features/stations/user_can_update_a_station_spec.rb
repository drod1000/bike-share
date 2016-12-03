require_relative '../../spec_helper'

describe "When a user vists '/stations/id/number/edit'" do
  it "they can update the information for that station" do
    station = Station.create(name: "Station 1", dock_count: 1, city: "Denver", installation_date: "1/2/2014" )

    visit "/stations/#{station.id}"
    click_on "Edit"

    fill_in "station[name]", with: "The Best Station"
    click_on "Submit"

    expect(current_path).to eq("/stations/#{station.id}")
    within "h1" do
      expect(page).to have_content("The Best Station")
    end
  end
end
