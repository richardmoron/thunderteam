Feature: Jugar
	Scenario: Inicio del Juego
	Given estoy en la pagina de inicio
	Then quiero ver el mensaje "Juego del Ahorcado"

	Scenario: Juego Iniciado
	Given estoy en la pagina de inicio
	When presiono el boton "Iniciar"
	Then quiero ver el mensaje "Juego Iniciado"

	Scenario: Juego Finalizado
	Given estoy en la pagina de fin del juego
	Then quiero ver el mensaje "Juego Finalizado"

	Scenario: Estado de Juego
	Given estoy en la pagina principal del juego
	Then quiero ver el mensaje "Estado del Juego: Iniciado"

	Scenario: Estado de Juego
	Given estoy en la pagina principal del juego
	Then quiero ver el mensaje "Intentos del Juego: 0"

	Scenario: pidiendo pista
	Given estoy en la pagina principal del juego
	When presiono el boton "pista"
	Then quiero ver el mensaje ""
	




