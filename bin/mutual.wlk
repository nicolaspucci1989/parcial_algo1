import Vivienda.*
import Persona.*
import UserException.*

object mutual {
	var horasDeTrabajoMinimas = 40
	var viviendasRegistradas = []	
	var familiasSocias = []
	
	method registrarVivienda(vivienda){
		viviendasRegistradas.add(vivienda)
	}	
	
	method registrarFamilia(familia) {
		familiasSocias.add(familia)
	}
	
	method registrarTrabajo(vivienda, trabajador, descripcion, horas){
		self.validarTrabajador(trabajador)
		vivienda.registrarTrabajo(trabajador, descripcion, horas)
		trabajador.trabajar(horas)
	}
	
	method validarTrabajador(trabajador){
		if(trabajador.esMenorDeEdad()) throw new UserException("No puede trabajar es menor")		
	}
	
	method sociosSinCasaPropio(){
		return familiasSocias.filter({ familia => !familia.tieneCasaPropia()})
	}
	
	method familiasSinCasaAlDia(){
		return self.sociosSinCasaPropio().filter({ familia => familia.estaAlDia(horasDeTrabajoMinimas)})
	}
	
	method familiasQueEntranEn(vivienda){
		return self.familiasSinCasaAlDia().filter({ familia => familia.cantidadDeIntegrantes() == vivienda.cantidadDeHabitantesMaximo()})
	}
	
	method asignarVivienda(vivienda){
		return self.familiasQueEntranEn(vivienda).max({ familia => familia.horasDeTrabajo() })
	}
	
	method darVivienda(vivienda){
		var familiaDestinataria = self.asignarVivienda(vivienda) 
		familiaDestinataria.darVivienda()
		familiasSocias.remove(familiaDestinataria)
		viviendasRegistradas.remove(vivienda)		
	}
	
	method viviendasTerminadas(){
		return viviendasRegistradas.filter({ vivienda => vivienda.estaTerminada() })
	}	
	
	method asignarViviendas(){
		self.viviendasTerminadas().forEach({ vivienda => self.darVivienda(vivienda) })	
	}	
}