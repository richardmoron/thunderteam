class Ahorcado
	def initialize 
		@secret = "elefante"
		@vidas = 6
	end

	def palabra_secreta
		@secret
	end

	def vidas
		@vidas
	end

	def adivinar(letra)
		if (@secret.include? letra)
			return true
		else
			@vidas -= 1
			return false
		end
	end  

end
