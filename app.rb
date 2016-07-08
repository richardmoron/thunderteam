require 'sinatra'

get '/' do
    erb :Inicio
end

post '/Principal' do
    erb :Principal
end
