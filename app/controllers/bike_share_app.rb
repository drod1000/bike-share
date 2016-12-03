class BikeShareApp < Sinatra::Base

  get '/trips' do
    trips = Trip.all.order(:start_date)
    trips = trips.each_slice(30)
    count = 0
    trips_hash = trips.group_by do |trip|
      trip[count]
      count += 1
    end
    @trips = trips_hash[params["page"].to_i].flatten
    erb :'trips/show'
  end

end
