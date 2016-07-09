require ("ahorcado")
describe Ahorcado do 
	it "deberia devolver elefante cuando se crea " do 
		ahorcado = Ahorcado.new
		ahorcado.palabra_secreta.should == "elefante"
	end 
	it "deberia tener 6 vidas cuando inicia el juego " do 
		ahorcado = Ahorcado.new
		ahorcado.vidas.should == 6
	end

	#it "deberia retornar true cuando acierta una letra de la palabra secreta " do 
	#	ahorcado = Ahorcado.new
	#	ahorcado.adivinar("a").should == true
	#end
	#it "deberia retornar false cuando acierta una letra de la palabra secreta " do 
	#	ahorcado = Ahorcado.new
	#	ahorcado.adivinar("b").should == false
	#end
	it "deberia descontar una vida cuando no acierta una letra de la secreta " do 
		ahorcado = Ahorcado.new
		ahorcado.adivinar("b")
		ahorcado.vidas.should == 5
	end
	it "deberia retornar la palabra secreta como vector " do 
		ahorcado = Ahorcado.new
		ahorcado.vector_secreto.should == ["e","l","e","f","a","n","t","e"]
	end
	it "deberia retornar vector vacio cuando no adivine" do 
		ahorcado = Ahorcado.new
		ahorcado.adivinar("b").should == ["","","","","","","",""]
	end
	it "deberia retornar vector con letras  cuando  adivine" do 
		ahorcado = Ahorcado.new
		ahorcado.adivinar("e").should == ["e","","e","","","","","e"]
	end
	
	it 'deberia devolver estado de jugador "jugando" cuando se crea ' do 
		ahorcado = Ahorcado.new
		ahorcado.estado_juego.should == 0 # estado jugando 
	end 
	
	it 'deberia devolver estado jugador "perdio" cuando pierde todas sus vidas ' do 
		ahorcado = Ahorcado.new
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
		ahorcado = Ahorcado.new
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
		ahorcado = Ahorcado.new
		ahorcado.intentos.should == 0
	end
	it "deberia mostrar el numero de intentos realizado por el jugador cuando adivina" do 
		ahorcado = Ahorcado.new
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
