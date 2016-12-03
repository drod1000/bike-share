require_relative "../spec_helper"


describe "trip/paths" do
  describe "/trips" do
    it "should only show the first thirty trips" do
      count = 0
      duration = 100
      35.times do |create_trips|
        Trip.create(id: count += 1, duration: duration += 10, start_date: "8/29/2013 9:08")
      end

      visit("/trips")
      expect(Trip.all.count).to eq (35)

      expect(page).to have_content("Trip Id")
    end

    it "should present the first thirty trips organized by date" do
      count = 0
      duration = 100
      day = 0
      35.times do |create_trips|
        Trip.create(id: count += 1, duration: duration += 10, start_date: "8/#{day += 1}/2013")
      end
      visit("/trips")

      expect(page).to_not have_content("Trip Id: 31")
      expect(Trip.first.start_date).to eq("8/1/2013")
      thirtieth_trip = Trip.find(30)
      expect(thirtieth_trip.start_date).to eq("8/30/2013")
    end

  end
end
