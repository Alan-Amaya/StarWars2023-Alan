import gente.*

class Planeta {
	const property habitantes = []
	var property museos
	var property longMurallas
	var property edificios
	const property galaxia
	
	method delegacionDiplimatica() = habitantes.filter({ h => h.esDestacado()})
	
	method valorInicialDefensivo() = habitantes.count({h => h.potencia()>=30})
	
	method esCulto() =  museos >=2 and habitantes.all({h => h.inteligencia() >=10})
	
	method potenciaReal() = habitantes.sum( {h => h.potencia()} )
	
	method construirMurallas(cantidad){	longMurallas += cantidad }
	
	method fundarMuseo(){ museos += 1 }
	
	method maximaPotencia() = habitantes.max( {h =>h.potencia()} ).potencia()
	method potenciaAparente() = self.maximaPotencia() * habitantes.size()
	
	method necesitaReforzarse() = self.potenciaAparente()*2 > self.potenciaReal()
	
	method recibirTributos(){ habitantes.forEach({h=>h.darTributos(self)}) }
	
	method apaciguar(otroPlaneta){	habitantes.forEach( { h=>h.darTributos(otroPlaneta) } )	}
	
	method indiceConstruccion() = longMurallas + museos*30 + edificios*10
	
	method esCopado() = self.esCulto() and habitantes.size() > 4
	
	method buenaDefensa() = self.valorInicialDefensivo() + galaxia.nvEnergiaBasico() >= 8
	
	
}