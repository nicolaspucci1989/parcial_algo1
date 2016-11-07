
class Familia {	
	var integrantes 
	var tieneCasaPropia
	
	constructor(_integrantes) {		
		integrantes = _integrantes
		tieneCasaPropia = false
	}	
	
	method tieneCasaPropio(){
		return tieneCasaPropia
	}
	
	method horasDeTrabajo(){
		return integrantes.sum({integrate => integrate.horasTrabajadas()})
	}
	
	method estaAlDia(horas){
		return self.horasDeTrabajo() >= horas
	}
	
	method cantidadDeIntegrantes(){
		return integrantes.size()
	}
			
	method tieneCasaPropia(){
		return tieneCasaPropia		
	}
	
	method darVivienda(){
		tieneCasaPropia = true
	}
}