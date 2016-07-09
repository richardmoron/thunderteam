require ("ahorcado")
describe Ahorcado do 
	it "deberia devolver la palabra secreta cuando se crea " do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.palabra_secreta.should == "elefante"
	end 
	it "deberia devolver el vector resolucion cuando se crea " do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.vector_resolucion.should == ["","","","","","","",""]
	end 
	it "el vector resolucion deberia devolver letras cuando acierta la secreta " do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.adivinar("e")
		ahorcado.vector_resolucion.should == ["e","","e","","","","","e"]
	end 
	it "el vector resolucion deberia devolver solo las letras acertadas " do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.adivinar("e")
		ahorcado.adivinar("b")
		ahorcado.adivinar("a")
		ahorcado.adivinar("z")
		ahorcado.vector_resolucion.should == ["e","","e","","a","","","e"]
	end 
	it "deberia devolver la pista cuando se crea " do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.pista.should == "mamifero mas grande terrestre"
	end
	it "deberia quitar un intento cuando pide la pista " do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.pista
		ahorcado.vidas.should == 5
	end
	it "deberia tener 6 vidas cuando inicia el juego " do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.vidas.should == 6
	end
	it "deberia descontar una vida cuando no acierta una letra de la secreta " do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.adivinar("b")
		ahorcado.vidas.should == 5
	end
	it "deberia retornar la palabra secreta como vector " do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.vector_secreto.should == ["e","l","e","f","a","n","t","e"]
	end
	it "deberia retornar vector vacio cuando no adivine" do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.adivinar("b").should == ["","","","","","","",""]
	end
	it "deberia retornar vector con letras  cuando  adivine" do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.adivinar("e").should == ["e","","e","","","","","e"]
	end
	
	it 'deberia devolver estado de jugador "jugando" cuando se crea ' do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.estado_juego.should == 0 # estado jugando 
	end 
	
	it 'deberia devolver estado jugador "perdio" cuando pierde todas sus vidas ' do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.vidas.should == 0
		ahorcado.estado_juego.should == -1 # estado jugando 
	end 
	
	it 'deberia devolver estado jugador "gano" tiene al menos una vida y acierta la secreta ' do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("e")
		ahorcado.adivinar("l")	
		ahorcado.adivinar("f")
		ahorcado.adivinar("a")
		ahorcado.adivinar("n")			
		ahorcado.adivinar("t")
		ahorcado.vidas.should == 1
		ahorcado.estado_juego.should == 1 # estado jugando 
	end 
	it "deberia tener 0 intentos cuando inicia el juego " do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.intentos.should == 0
	end
	it "deberia mostrar el numero de intentos realizado por el jugador cuando adivina" do 
		ahorcado = Ahorcado.new("elefante", "mamifero mas grande terrestre")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("b")
		ahorcado.adivinar("e")
		ahorcado.adivinar("l")	
		ahorcado.adivinar("f")
		ahorcado.adivinar("a")
		ahorcado.adivinar("n")			
		ahorcado.adivinar("t")
		ahorcado.intentos.should == 11
	end
end
