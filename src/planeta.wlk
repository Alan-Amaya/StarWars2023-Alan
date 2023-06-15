class Planeta {
	const property habitantes = []
	var property museos
	var property longMurallas
	
	method delegacionDiplimatica() = habitantes.map({ h => h.esDestacado()})
	
	method valorInicialDefensivo() = habitantes.sum({h => h.potencia()>=30})
	
	method esCulto() =  museos >=2 and habitantes.all({h => h.inteligencia() >=10})
	
	method potenciaReal() = habitantes.sum( {h => h.potencia()} )
	
	method construirMurallas(cantidad){	longMurallas += cantidad }
	
	method fundarMuseo(){ museos += 1 }
	
	method potenciaAparente() = habitantes.max( {h =>h.potencia()} ) * 4
	
	method necesitaReforzarse() = self.potenciaAparente()*2 > self.potenciaReal()
	
	method recibirTributos(){ habitantes.forEach({h=>h.darTributos(self)}) }
	
}