require 'sinatra'
require './lib/ahorcado.rb'

get '/' do	
    erb :Inicio
end

get '/Principal' do
	@@ahorcado = Ahorcado.new(@@secreta,@@pista)
	@longitud = @@ahorcado.palabra_secreta.size
	@columnas = ''
	@longitud.times do 
		@columnas += '<td>&nbsp;</td>'
	end
	@estado = "Iniciado"
	@intentos = 0
    erb :Principal
end

post '/Iniciar' do
	@@secreta = params[:secreta]
	@@pista = params[:pista]
	@@ahorcado = Ahorcado.new(@@secreta,@@pista)
	@longitud = @@ahorcado.palabra_secreta.size
	@columnas = ''
	@longitud.times do 
		@columnas += '<td>&nbsp;</td>'
	end
	@estado = "Iniciado"
	@intentos = 0
    erb :Principal
end

post '/mostrar_pista' do 
	@pista = @@ahorcado.pista
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
	@estado = ""
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

