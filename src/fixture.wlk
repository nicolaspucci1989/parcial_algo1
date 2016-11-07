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
	
	method crearFamilia2(){
			var papa = new Persona(32)
			var mama =  new Persona(32)
			papa.trabajar(40)
			mama.trabajar(22)
			return new Familia([ papa, mama, new Persona(15)])
		}
		
	method crearFamilia3(){
			var papa = new Persona(32)			
			papa.trabajar(40)			
			return new Familia([ papa, new Persona(15)])
	}
		
	method crearFamilia4(){
		var papa = new Persona(32)
		var mama =  new Persona(32)
		papa.trabajar(40)
		mama.trabajar(50)
		return new Familia([ papa, mama, new Persona(25), new Persona(15)])
	}
	
	method crearCasa4Ambientes(){
		return new Casa(40, 4)
	}
	
	method registrarFamiliasYcasa(familia1, familia2, familia3, familia4, casa){
		mutual.registrarVivienda(casa)
		mutual.registrarFamilia(familia1)
		mutual.registrarFamilia(familia2)
		mutual.registrarFamilia(familia3)
		mutual.registrarFamilia(familia4)
	}
		
		
}