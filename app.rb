require 'sinatra'
require './lib/ahorcado.rb'

get '/' do	
    erb :Inicio
end

post '/Principal' do
	@@ahorcado = Ahorcado.new(params[:secreta],params[:pista])
	@longitud = @@ahorcado.palabra_secreta.size
	@columnas = ''
	@longitud.times do 
		@columnas += '<td>&nbsp;</td>'
	end
	@estado = "Juego Iniciado"
	@intentos = 0
    erb :Principal
end

post '/Adivinar' do
	letra = params[:letra]
	@vector = @@ahorcado.adivinar(letra)
	@columnas = ''
	@vector.each do |x| 
		if x == ''
			@columnas += '<td>&nbsp;</td>'
		else
			@columnas += "<td>#{x}</td>"
		end
		
	end
	@estado = "Juego Iniciado"
	if @@ahorcado.estado_juego() == 0
		@estado = "Jugando"	
	end
	if @@ahorcado.estado_juego() == -1
		@estado = "Perdio"	
	end
	if @@ahorcado.estado_juego() == 1
		@estado = "Gano"	
	end

	@intentos = @@ahorcado.intentos()
    erb :Principal
end

get '/Fin' do
  erb :Fin
end

