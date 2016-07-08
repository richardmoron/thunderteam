require ("ahorcado")
describe Ahorcado do 
	it "deberia devolver elefante cuando se crea " do 
		ahorcado = Ahorcado.new
		ahorcado.palabra_secreta.should == "elefante"
	end 
end
