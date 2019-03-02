require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params["pirate"])
      
      params["pirate"]["ships"].each do |ship_data|
        Ship.new(ship_data)
      end

      @ships = Ship.all

      erb :'pirates/show'
    end

  end
end

# dynamically- we want to be able to access the pirate name by id 

# get '/pirate/:id' do 
#   @pirate = Pirate.find(params[:id]) 
#     erb :'pirate/show'
# end 