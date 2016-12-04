class BikeShareApp < Sinatra::Base
  get '/conditions' do
    @conditions = Condition.all
    erb :"conditions/index"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end

  post '/conditions' do
    condition = Condition.new(params[:condition])
    condition.save
    redirect "/conditions"
  end

  put '/conditions/:id' do
    # condition = Condition.find(params[:id])
    # condition.update_attributes(params[:conditon])
    Condition.update(params[:id], params[:condition])
    redirect "/conditions/#{params[:id]}"
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :"conditions/edit"
  end

end
