class Ahorcado
	def initialize 
		@secret = "elefante"
		@vector_secreto = @secret.split("")
		@vector_resolucion= []
		@vector_secreto.length.times do
			@vector_resolucion.push("")
		end
		@vidas = 6
	end

	def palabra_secreta
		@secret
	end
	
	def vector_secreto
		@vector_secreto
	end

	def vidas
		@vidas
	end

	def adivinar(letra)
		if (@secret.include? letra)
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
		@vector_resolucion
	end  

end
