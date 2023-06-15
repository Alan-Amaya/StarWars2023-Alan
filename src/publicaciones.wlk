class Publicaciones {
	var property tema
	var property inteligenciaQueAporta
	var property utilParaDefensa
	var property valorGlobal
}

class Manuales inherits Publicaciones {
	override method inteligenciaQueAporta() = 5
	
	override method valorGlobal(){
		if (utilParaDefensa) return 10
		else return 4 
	}
}

class Novelas inherits Publicaciones {
	override method tema() = "Literatura"
	
	override method utilParaDefensa() = false
	
	override method valorGlobal() = inteligenciaQueAporta*2
}