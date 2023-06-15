import planeta.*
import armas.*

class Gente {
	var property edad
	const property potencia = 20
	
	method inteligencia() {
		if (edad.between(20,40)) return 12
		else return 8
		}
	
	method esDestacado() = edad.between(25,35)
	
	method darTributos(planeta){}
	
	method valor() = self.inteligencia() + self.potencia()	
}

class Atleta inherits Gente {
	var property masaMuscular = 4
	var property cantTecnicas = 2
	
	override method potencia() = potencia + (masaMuscular*cantTecnicas)
	
	override method esDestacado() = super() or cantTecnicas > 5
	
	method entrenar(dias){	masaMuscular += dias/5.truncate(0)	}
	
	method aprenderTecnica(){ cantTecnicas += 1}
	
	override method darTributos(planeta){ planeta.fundarMuseo()}
	
	method esUtil(planeta) = planeta.necesitaReforzarse() 
}

class Docente inherits Gente {
	var property cursosDados = 0
	
	override method inteligencia() = super() + cursosDados*2
	
	override method esDestacado() = cursosDados > 3
	
	override method darTributos(planeta){ planeta.construirMurallas(2)}
	
	override method valor() = super() + 5
	
	method esUtil(planeta) = !planeta.esCulto()
}

class Soldado inherits Gente {
	const property armas = []
	
	override method potencia() = super() + armas.sum({a=>a.potencia()})
	
	method agregarArma(arma){
		arma.agregarPropietario(self)
		armas.add(arma)
	}
	
	override method darTributos(planeta){ planeta.construirMurallas(2)}
	method esUtil(planeta) = planeta.potenciaReal() < 40
}

class Tecnicos inherits Gente {
	const property publicaciones = []
	
	method inteligenciaDeLibros() = publicaciones.sum({p=> p.inteligenciaQueAporta()})
	method cantLibrosUtiles() = publicaciones.count({p=>p.utilParaDefensa()})
	method cantLibros() = publicaciones.size()
	method sumarASuColeccion(unLibro){ publicaciones.add(unLibro) }
	
	override method inteligencia() = super() + self.inteligenciaDeLibros()
	override method potencia() = super() + self.cantLibrosUtiles()
	
	override method darTributos(planeta){ planeta.construirEdificio(1)}
	
	override method esDestacado() = super() and self.cantLibros() > 3
	
	method sabeDelTema(unTema) = publicaciones.any({p=>p.tema() == unTema})
	method materialSobreElTema(unTema) = publicaciones.filter({p=>p.tema() == unTema})
	method materialMenosUtil() = publicaciones.min({p=> p.inteligenciaQueAporta()})
	
	method donarMaterialMenosUtil(otroTecnico){
		otroTecnico.sumarASuColeccion(self.materialMenosUtil())
		publicaciones.remove(self.materialMenosUtil())
	}
	
	method esUtil(planeta) = planeta.habitantes().size() >= 3
}

class Agricultores inherits Gente {
	var property experiencia
	const property sabeDeRiego
	
	override method inteligencia(){
		if (sabeDeRiego) return experiencia*2
		else return experiencia 
	}
	
	override method potencia() = 5
	
	override method esDestacado() = super() or (sabeDeRiego and experiencia >=5)
	
	method acumularExp(cant){ experiencia += cant}
	method esUtil(planeta) = true
}