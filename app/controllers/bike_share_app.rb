class BikeShareApp < Sinatra::Base
  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  get '/stations/:id/edit' do |id|
    @station = Station.find(id)
    erb :"stations/edit"
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :"stations/show"
  end

  post '/station' do
    station = Station.create(params["station"])
    redirect :"stations/#{station.id}"
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end
end
