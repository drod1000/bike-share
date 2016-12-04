# require "smarter_csv"
# require "pry"
#  # CSV.parse('db/csv/station.csv', :headers=> true) do |row|
#  #   binding.pry
#  #   Station.create({name: row[1], dock_count: row[2], city: row[3], installation_date: row[4]})
#  # end
#  # puts "Imported Stations to Table."
#
#
#   SmarterCSV.process('db/csv/trip.csv').each do |row|
#     # binding.pry
#       Trip.create(row)
#   end
#   puts "Imported Trips to Table."
