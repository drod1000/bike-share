class BikeShareApp < Sinatra::Base
  get '/conditions' do
    erb :"conditions/index"
  end

  get '/conditions/new' do

  end

  get '/conditions/:id' do
    erb :show
  end

  get '/conditions/:id/edit' do

  end

end
