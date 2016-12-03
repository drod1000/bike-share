require "csv"
 CSV.parse('db/csv/trip.csv', :headers=> true) do |row|

   Trip.create({duration: row[1], start_date: row[2], start_station_name: row[3], start_station_id: row[4], end_date: row[5], end_station_name: row[6], end_station_id: row[7], bike_id: row[8], subscription_type: row[9], zip_code: row[10]})
 end
 puts "Imported Trips to Table."
