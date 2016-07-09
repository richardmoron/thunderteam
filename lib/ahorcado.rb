class Ahorcado
	def initialize(palabra_secreta, pista )
		@secret = palabra_secreta
		@pista = pista
		@vector_secreto = @secret.split("")
		@vector_resolucion= []
		@vector_secreto.length.times do
			@vector_resolucion.push("")
		end
		@vidas = 6
		@estado_juego = 0
		@intentos = 0
	end
	
	def estado_juego
		@estado_juego
	end
	
	def intentos
		@intentos
	end

	def palabra_secreta
		@secret
	end
	
	def pista
		@vidas -= 1
		@pista
	end
	
	def vector_secreto
		@vector_secreto
	end

	def vidas
		@vidas
	end

	def adivinar(letra)
		if (letra != "" and @secret.include? letra)
		    posicion = 0
			@vector_secreto.each do |letra_secreta|
				if(letra == letra_secreta)
					@vector_resolucion[posicion] = letra
				end 
				posicion += 1
			end
		else
			@vidas -= 1
		end
		if @vidas == 0
			@estado_juego = -1
		end
		if(@vidas > 0 && @vector_secreto == @vector_resolucion)
			@estado_juego = 1
		end
		@intentos += 1
		@vector_resolucion
	end  

end
