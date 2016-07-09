require 'sinatra'
require './lib/ahorcado.rb'

configure do
    set :ahorcado , nil
end

get '/' do	
    erb :Inicio
end

get '/Principal' do
	settings.ahorcado = Ahorcado.new(@@secreta,@@pista)
	@longitud = settings.ahorcado.palabra_secreta.size
	@columnas = ''
	@longitud.times do 
		@columnas += '<td>&nbsp;</td>'
	end
	@estado = "Iniciado"
	@intentos = 0
	@intentos_fallidos = 0
	@intentos_restantes = 0
    erb :Principal
end

post '/Iniciar' do
	settings.ahorcado = Ahorcado.new(params[:secreta],params[:pista])
	@@secreta = params[:secreta]
	@@pista = params[:pista]
	@longitud = settings.ahorcado.palabra_secreta.size
	@columnas = ''
	@longitud.times do 
		@columnas += '<td>&nbsp;</td>'
	end
	@estado = "Iniciado"
	@intentos = 0
	@intentos_fallidos = 0
	@intentos_restantes = 0
    erb :Principal
end

post '/mostrar_pista' do 
	@columnas = ''
	settings.ahorcado.vector_resolucion.each do |x| 
		if x == ''
			@columnas += '<td>&nbsp;</td>'
		else
			@columnas += "<td>#{x}</td>"
		end
		
	end
	@pista = settings.ahorcado.pista
	erb :Principal
end

post '/Adivinar' do
	letra = params[:letra]
	@vector = settings.ahorcado.adivinar(letra)
	@columnas = ''
	@vector.each do |x| 
		if x == ''
			@columnas += '<td>&nbsp;</td>'
		else
			@columnas += "<td>#{x}</td>"
		end
		
	end
	@estado = ""
	if settings.ahorcado.estado_juego() == 0
		@estado = "Jugando"	
	end
	if settings.ahorcado.estado_juego() == -1
		@estado = "Perdio"	
	end
	if settings.ahorcado.estado_juego() == 1
		@estado = "Gano"	
	end
	
	@intentos_fallidos = 6  - settings.ahorcado.vidas()
	@intentos_restantes = settings.ahorcado.vidas()
	@intentos = settings.ahorcado.intentos()
    erb :Principal
end

get '/Fin' do
  erb :Fin
end

