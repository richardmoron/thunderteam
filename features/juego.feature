Feature: Jugar
	Scenario: Inicio del Juego
	Given estoy en la pagina de inicio
	Then quiero ver el mensaje "Juego del Ahorcado"

	Scenario: Juego Iniciado
	Given estoy en la pagina de inicio
	When presiono el boton "Iniciar"
	Then quiero ver el mensaje "Juego Iniciado"