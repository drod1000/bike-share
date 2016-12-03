class BikeShareApp < Sinatra::Base

  get '/trips' do
    trips = Trip.all.order(:start_date)
    trips = trips.each_slice(30)
    count = 0
    # binding.pry
    trips_hash = create_trip_hash(trips,count)
    # binding.pry
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
    # binding.pry
    if search_value.nil?
      trips_hash[1].flatten
    else
      trips_hash[search_value.to_i].flatten
    end
  end

  get '/trips/:id' do
    @trip = Trip.find(params["id"].to_i)

    erb :'trips/show'
  end

  get '/trips/new' do
    Trip.create(params[:trip])

    erb :'trips/new'
    redirect '/trips'
  end

end
