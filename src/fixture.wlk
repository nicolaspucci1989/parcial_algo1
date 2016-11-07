import Persona.*
import Familia.*
import mutual.*
import Vivienda.* 

object fixture {
	
	method crearFamilia1(){
		var papa = new Persona(32)
		var mama =  new Persona(32)
		papa.trabajar(40)
		mama.trabajar(40)
		return new Familia([ papa, mama, new Persona(25), new Persona(15)])
	}
	
	method crearFamilia2(){//62 horas
			var papa = new Persona(32)
			var mama =  new Persona(32)
			papa.trabajar(40)
			mama.trabajar(22)
			return new Familia([ papa, mama, new Persona(15)])
		}
		
	method crearFamilia3(){// 40 horas
			var papa = new Persona(32)			
			papa.trabajar(40)			
			return new Familia([ papa, new Persona(15)])
	}
		
	method crearFamilia4(){// 90 horas
		var papa = new Persona(32)
		var mama =  new Persona(32)
		papa.trabajar(40)
		mama.trabajar(50)
		return new Familia([ papa, mama, new Persona(25), new Persona(15)])
	}
	
	method crearCasa4Ambientes(){
		var casa = new Casa(40, 4)
		casa.registrarTrabajo("", "", 45)
		return casa		
	}
	
	method crearCasa3Ambientes(){
		var casa = new Casa(40, 3)
		casa.registrarTrabajo("", "", 45)
		return casa		
	}
	
	method crearCasa2Ambientes(){
		var casa = new Casa(40, 2)
		casa.registrarTrabajo("", "", 45)
		return casa
	}
	
	method crearDepartamento(){
		var depto = new Departamento(30,1000)
		depto.registrarTrabajo("", "", 35)
		return depto
	}
	
	method registrarFamiliasYcasa(familia1, familia2, familia3, familia4, casa){
		mutual.registrarVivienda(casa)
		mutual.registrarFamilia(familia1)
		mutual.registrarFamilia(familia2)
		mutual.registrarFamilia(familia3)
		mutual.registrarFamilia(familia4)
	}
		
		
}