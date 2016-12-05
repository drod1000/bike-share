require_relative '../spec_helper'
require 'date'

describe "Station" do
  describe "validates" do
    it "presence of name" do
      invalid_station = Station.new(dock_count: 1, city: "Denver", installation_date: 12/2/2016)

      expect(invalid_station).to_not be_valid
    end
    it "presence of dock count" do
      invalid_station = Station.new(name: "Station 1", city: "Denver", installation_date: 12/2/2016)

      expect(invalid_station).to_not be_valid
    end
    it "presence of city" do
      invalid_station = Station.new(name: "Station 1", dock_count: 1, installation_date: 12/2/2016)

      expect(invalid_station).to_not be_valid
    end
    it "presence of installation date" do
      invalid_station = Station.new(name: "Station 1", dock_count: 1, city: "Denver")

      expect(invalid_station).to_not be_valid
    end
  end
  describe "returns" do
    station = Station.new(name: "Station 1", dock_count: 1, city: "Denver", installation_date: "12/2/2016")
    it "name" do
      expect(station.name).to eq "Station 1"
    end
    it "dock_count" do
      expect(station.dock_count).to eq 1
    end
    it "city" do
      expect(station.city).to eq "Denver"
    end
    it "installation date" do
      expect(station.installation_date).to eq "12/2/2016"
    end
  end
  describe "calculates" do
    Station.create(name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
    Station.create(name: "Station 2", dock_count: 15, city: "Denver", installation_date: "1/10/2015")
    Station.create(name: "Station 3", dock_count: 20, city: "Denver", installation_date: "8/17/2016")
    Station.create(name: "Station 4", dock_count: 25, city: "Denver", installation_date: "12/31/2015")
    it "total count of stations" do
      expect(station.total_stations).to eq 4
    end
    it "average bikes available per station" do
      expect(station.average_number_of_bikes).to eq 17.5
    end
    it "most bikes available at a station" do
      expect(station.most_bikes_available).to eq 25
    end
    it "station where the most bikes are available" do
      expect(station.with_fewest_bikes.id). to eq 1
    end
    it "fewest bikes available at a station" do
      expect(station.fewest_bikes_available).to eq 10
    end
    it "station where the fewest bikes are available" do
      expect(station.with_most_bikes.id). to eq 4
    end
    it "most recently installed station" do
      expect(station.newest_station).to eq Date.parse(8/17/2016)
    end
  end
end
