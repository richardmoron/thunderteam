require ("ahorcado")
describe Ahorcado do 
	it "deberia devolver elefante cuando se crea " do 
		ahorcado = Ahorcado.new
		ahorcado.palabra_secreta.should == "elefante"
	end 
	it "deberia tener 6 intentos cuando inicia el juego " do 
		ahorcado = Ahorcado.new
		ahorcado.intentos.should == 6
	end
	it "deberia retornar true cuando acierta una letra de la palabra secreta " do 
		ahorcado = Ahorcado.new
		ahorcado.adivinar("a").should == true
	end
	it "deberia retornar false cuando acierta una letra de la palabra secreta " do 
		ahorcado = Ahorcado.new
		ahorcado.adivinar("b").should == false
	end
	it "deberia descontar un intento cuando no acierta una letra de la secreta " do 
		ahorcado = Ahorcado.new
		ahorcado.adivinar("b")
		ahorcado.intentos.should == 5
	end
end
