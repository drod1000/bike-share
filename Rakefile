require "bundler"
Bundler.require

require "sinatra/activerecord/rake"
require "csv"
require 'io/console'
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
 IO.open('db/csv/trip.csv', :headers=> true) do |csv|
   csv.each_line do |row|
     Trip.create({duration: row[1], start_date: row[2], start_station_name: row[3], start_station_id: row[4], end_date: row[5], end_station_name: row[6], end_station_id: row[7], bike_id: row[8], subscription_type: row[9], zip_code: row[10]})
   end
 end
 puts "Imported Trips to Table."
end

def create_stations
 CSV.('db/csv/station.csv', :headers=> true) do |row|

   Station.create({name: row[1], dock_count: row[2], city: row[3], installation_date: row[4]})
 end
 puts "Imported Stations to Table."
end
