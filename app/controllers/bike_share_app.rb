class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/trips' do
    trips = Trip.all.order(:start_date)
    trips = trips.each_slice(30)
    count = 0
    trips_hash = create_trip_hash(trips,count)
    @trips = find_correct_trip_grouping(trips_hash,params["page"])
    erb :'trips/index'
  end

  def create_trip_hash(trips,count)
    trips.group_by do |trip|
      trip[count]
      count += 1
    end
  end

  def find_correct_trip_grouping(trips_hash,search_value)
    if search_value.nil?
      trips_hash[1].flatten
    else
      trips_hash[search_value.to_i].flatten
    end
  end

  get '/trips/new' do
    erb :'trips/new'
  end

  post '/trips' do
    Trip.create(params[:trip])
    redirect '/trips'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id].to_i)
    erb :'trips/show'
  end

  get '/trips/:id/edit' do
    # binding.pry
    @trip = Trip.find(params[:id])
    # binding.pry
    erb :'trips/edit'
  end

  put '/trips/:id' do
    trip = Trip.find(params[:id])
    trip.update_attributes(params[:trip])
    redirect "trips/#{trip.id}"
  end




end
