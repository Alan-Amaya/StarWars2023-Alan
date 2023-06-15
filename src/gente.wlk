class Gente {
	var property edad
	const property potencia = 20
	
	method inteligencia() {
		if (edad.between(20,40)) return 12
		else return 8
		}
	
	method esDestacado() = edad.between(25,35)
	
	method darTributos(planeta){}	
}

class Atleta inherits Gente {
	var property masaMuscular = 4
	var property cantTecnicas = 2
	
	override method potencia() = potencia + (masaMuscular*cantTecnicas)
	
	override method esDestacado() = super() or cantTecnicas > 5
	
	method entrenar(dias){	masaMuscular += dias/5.truncate(0)	}
	
	method aprenderTecnica(){ cantTecnicas += 1}
	
	override method darTributos(planeta){ planeta.fundarMuseo()}
}

class Docente inherits Gente {
	var property cursosDados = 0
	
	override method inteligencia() = super() + cursosDados*2
	
	override method esDestacado() = cursosDados > 3
	
	override method darTributos(planeta){ planeta.construirMurallas(2)}
}
