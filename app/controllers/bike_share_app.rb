class BikeShareApp < Sinatra::Base
  get '/conditions' do
    erb :"conditions/index"
  end

  get '/conditions/new' do

  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  get '/conditions/:id/edit' do

  end

end
