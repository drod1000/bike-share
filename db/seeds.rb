require "csv"
 CSV.parse('db/csv/weather.csv', :headers=> true) do |row|

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
 puts "Imported Conditions to Table."
