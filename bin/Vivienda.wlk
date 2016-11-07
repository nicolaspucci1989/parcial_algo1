
class Vivienda {
	var trabajosRealizados = []
	var cantidadDeHorasDeTrabajoNecesaciras	
	var estaAsignada 
	
	constructor(horas){
		cantidadDeHorasDeTrabajoNecesaciras = horas
		estaAsignada = false 
	}
	
	method registrarTrabajo(trabajador, descripcion, horas){
		trabajosRealizados.add(new Trabajo(trabajador, descripcion, horas))
	}
	
	method cantidadDeHorasTrabajadas(){
		return trabajosRealizados.sum({ trabajo => trabajo.horas() })
	}
	
	method cantidadDeHorasDeTrabajoNecesaciras(){
		return cantidadDeHorasDeTrabajoNecesaciras
	}
	
	method quienesTrabajaron(){
		return trabajosRealizados.map({trabajo => trabajo.trabajador()}).asSet()		
	}
	
	method sociosQueTrabajaron(){
		return self.quienesTrabajaron().size()
	}
	
	method horasTrabajadas(){
		return trabajosRealizados.sum({ trabajo => trabajo.horasDeTrabajo() })
	}
	
	method estaTerminada(){
		return self.horasTrabajadas() > cantidadDeHorasDeTrabajoNecesaciras 
	}
	
	method estasAsignada(){
		estaAsignada = true
	}
}

class Departamento inherits Vivienda{
	var superficieTotal
	const superficieMinimaPorPersona = 15
	
	constructor(horas, superficie) = super(horas) {
		superficieTotal = superficie
	}
	
	method cantidadDeHabitantesMaximo(){
		return superficieTotal / superficieMinimaPorPersona	
	}
}

class Casa inherits Vivienda{
	var cantidadDeAmbientes
	
	constructor(horas, ambientes) = super(horas) {
		cantidadDeAmbientes = ambientes
	}
	
	method cantidadDeHabitantesMaximo(){
		return cantidadDeAmbientes	
	}
}

class Trabajo {
	const trabajador
	const descripcion
	const horasDeTrabajo
	
	constructor(_trabajador, _descripcion, _horas){
		trabajador = _trabajador
		descripcion = _descripcion
		horasDeTrabajo = _horas
	}
	
	method horasDeTrabajo(){
		return horasDeTrabajo
	}
	
	method trabajador(){
		return trabajador
	}
}