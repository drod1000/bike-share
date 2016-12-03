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

  desc "Import Weather.csv to table"
  task :conditions do
    create_conditions
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

def create_conditions
  SmarterCSV.process('db/csv/weather.csv') do |row|
    Condition.create(row)
    # {date: row[1], max_temperature_f: row[2],
    #  mean_temperature_f: row[3], min_temperature_f: row[4],
    #  max_dew_point: row[5], mean_dew_point: row[6], min_dew_point: row[7],
    #  max_humidity: row[8], mean_humidity: row[9], min_humidity: row[10],
    #  max_sea_level_pressure_inches: row[11], mean_sea_level_pressure_inches:
    #  row[12], min_sea_level_pressure_inches: row[13], max_visibility_miles:
    #  row[14], mean_visibility_miles: row[15], min_visibility_miles: row[16],
    #  max_wind_Speed_mph: row[17], mean_wind_speed_mph: row[18],
    #  max_gust_speed_mph: row[19], precipitation_inches: row[20], cloud_cover:
    #  row[21], event: row[22], wind_dir_degrees: row[23], zip_code: row[24]})
  end
  puts "Imported Weather to Table"
end
