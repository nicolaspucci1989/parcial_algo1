
class Persona {	
	var edad	
	var horasTrabajadas 
	
	constructor(_edad){
		edad = _edad
		horasTrabajadas= 0		
	}
	
	method edad(){
		return edad
	}	
	
	method horasTrabajadas(){
		return horasTrabajadas
	}
	
	method trabajar(horas){
		horasTrabajadas += horas
	}
	
	method esMenorDeEdad(){
		return edad <= 18
	}	
	
}

