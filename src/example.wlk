class Persona {
	const enfermedades = []
	var property temperatura = 36
	var property celulas
	
	
	method contraer(enfermedad){
		if (enfermedades.size() < 5)
		enfermedades.add(enfermedad)
	}
	
	method pasarUnDia(){
		enfermedades.forEach({e => e.causarSintoma(self)})
	}
	
	method aumentarTemperatura(valor){
		45.min(temperatura += valor)
	}
	
	method destruirCelulas(cantidad){
		celulas -= cantidad
	}
	
	method estaEnComa() = temperatura == 45 
	
	method muerte() {
		temperatura = 0
	}
	
	method celulasAmenazadasPorAgresivas(){
		enfermedades
		.filter({e=>e.esAgresiva(self)})
		.sum({e=>e.celulasAmenazadas()})
	}
}


class Enfermedad {
	var celulas
	
	method celulasAmenazadas() = celulas
	
	method atenuar(cantidad){
		celulas -= cantidad * 15
	}
}


class EnfermedadInfecciosa inherits Enfermedad {
	
	method causarSintoma(persona){
		persona.aumentarTemperatura(celulas / 1000)
	}
	
	method esAgresiva(persona) =
	celulas > persona.celulas() / 10
}


class EnfermedadAutoinmune inherits Enfermedad {
	var dias = 0
	
	method causarSintoma(persona){
		persona.destruirCelulas(celulas)
		dias += 1
	}
	
	method esAgresiva(persona) =
	dias >= 30
}

class Medico inherits Persona{
	
}

class MedicoJefe inherits Medico{
	
}
	