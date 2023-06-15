class Pistolete {
	const property largo
	var propietario
	
	method potencia(){
		 if (propietario.edad()>30)return largo*3
		 else return largo*2	
	}
	
	method agregarPropietario(nuevo){	propietario = nuevo	}
}

class Espadon {
	const property peso
	var propietario
	
	method potencia(){
		if (propietario.edad()>=40)return peso/2
		 else return 6	
	}
	
	method agregarPropietario(nuevo){propietario = nuevo	}
}
