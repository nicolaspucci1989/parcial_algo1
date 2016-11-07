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
	
	method registrarViviendas(viviendas){
		viviendasRegistradas = viviendas
	}
	
	method registrarFamilia(familia) {
		familiasSocias.add(familia)
	}
	
	method registrarFamilias(familias){
		familiasSocias = familias
	}
	
	method registrarTrabajo(vivienda, trabajador, descripcion, horas){
		self.validarTrabajador(trabajador)
		vivienda.registrarTrabajo(trabajador, descripcion, horas)
		trabajador.trabajar(horas)
	}
	
	method validarTrabajador(trabajador){
		if(trabajador.esMenorDeEdad()) throw new UserException("No puede trabajar es menor")		
	}
	
	method familiasSinCasaAlDia(){
		return familiasSocias.filter({ familia => familia.estaAlDia(horasDeTrabajoMinimas) and !familia.tieneCasaPropia()})
	}
	
	method familiasQueEntranEn(vivienda){
		return self.familiasSinCasaAlDia().filter({ familia => familia.cantidadDeIntegrantes() == vivienda.cantidadDeHabitantesMaximo()})
	}
	
	method asignarVivienda(vivienda){
		return self.familiasQueEntranEn(vivienda).max({ familia => familia.horasDeTrabajo() })
	}
	
	method darVivienda(vivienda){
		var familiaDestinataria = self.asignarVivienda(vivienda) 
		familiaDestinataria.tenesVivienda()
		vivienda.estasAsignada()			
	}	
	
	method viviendasTerminadasSinFamilia(){
		return viviendasRegistradas.filter({ vivienda => vivienda.estaTerminada() and
														!vivienda.asignada()})
	}	
	
	method asignarTodasLasViviendasPosibles(){
		self.viviendasTerminadasSinFamilia().forEach({ vivienda => self.darVivienda(vivienda) })	
	}	
}