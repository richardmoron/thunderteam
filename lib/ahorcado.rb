class Ahorcado
	def initialize 
		@secret = "elefante"
		@intentos = 6
	end

	def palabra_secreta
		@secret
	end

	def intentos
		@intentos
	end

	def adivinar(letra)
		if (@secret.include? letra)
			return true
		else
			@intentos -= 1
			return false
		end
	end 

end
