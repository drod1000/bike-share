class BikeShareApp < Sinatra::Base
  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :"stations/show"
  end

  post '/station' do
    station = Station.create(params["station"])
    redirect :"stations/#{station.id}"
  end
end
