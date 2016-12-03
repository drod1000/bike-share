require_relative "../spec_helper"


describe "Trip" do
  describe ".duration" do
    it "returns the id of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.id).to eq(4069)
    end

    it "returns the duration of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.duration).to eq(174)
    end

    it "returns the start_date of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)
      # binding.pry
      expect(trip.start_date).to eq("8/29/2013 9:08")
    end

    it "returns the start_station_name of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.start_station_name).to eq("2nd at South Park")
    end

    it "returns the start_station_id of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.start_station_id).to eq(64)
    end

    it "returns the end_date of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.end_date).to eq("8/29/2013 9:11")

    end

    it "returns the end_station_name of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.end_station_name).to eq("2nd at South Park")
    end

    it "returns the end_station_id of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.end_station_id).to eq(64)
    end

    it "returns the bike_id of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.bike_id).to eq(288)
    end

    it "returns the subscription_type of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.subscription_type).to eq("Subscriber")
    end

    it "returns the zip_code of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.zip_code).to eq(94114)
    end

  end

  describe 'validates' do
    it

  end
end
