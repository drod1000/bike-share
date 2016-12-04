require "bundler"
Bundler.require

require "sinatra/activerecord/rake"
require File.expand_path('../config/environment',  __FILE__)

namespace :import do
  desc "Import Trips.csv to table"
  task :trips do
    create_trips
  end

  desc "Import Stations.csv to table"
  task :stations do
    create_stations
  end
end

def create_trips
  SmarterCSV.process('db/csv/trip.csv').each do |row|
    Trip.create(row)
  end
  puts "Imported Trips to Table."
end

def create_stations
  SmarterCSV.process('db/csv/station.csv').each do |row|
      Station.create(id: row[0], name: row[1], dock_count: row[4], city: row[5], installation_date: Date.strptime(row[6], "%m/%d/%Y"))
  end
  puts "Imported Stations to Table."
end
