require "bundler"
Bundler.require

require "sinatra/activerecord/rake"
require 'csv'
require 'io/console'
require File.expand_path('../config/environment', __FILE__)

namespace :import do
  desc "Import Trips.csv to table"
  task :trips do
    create_trips
  end

  desc "Import Stations.csv to table"
  task :stations do
    create_stations
  end

  desc "Import Conditions.csv to table"
  task :conditions do
    create_conditions
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

def create_conditions
  IO.open('db/csv.weather.csv', :headers=> true) do |csv|
    csv.each_line do |row|
      Condition.create({date: row[1], max_temperature_f: row[2],
     mean_temperature_f: row[3], min_temperature_f: row[4],
     max_dew_point_f: row[5], mean_dew_point_f: row[6], min_dew_point_f: row[7],
     max_humidity: row[8], mean_humidity: row[9], min_humidity: row[10],
     max_sea_level_pressure_inches: row[11], mean_sea_level_pressure_inches:
     row[12], min_sea_level_pressure_inches: row[13], max_visibility_miles:
     row[14], mean_visibility_miles: row[15], min_visibility_miles: row[16],
     max_wind_Speed_mph: row[17], mean_wind_speed_mph: row[18],
     max_gust_speed_mph: row[19], precipitation_inches: row[20], cloud_cover:
     row[21], event: row[22], wind_dir_degrees: row[23], zip_code: row[24]})
    end
  end
  puts "Imported Weather to Table"
 end
