class Nave{
	var property velocidad
	var property amenaza = false
	var vLimite = 300000
	
	method propulsar(){
		velocidad += 20000
		self.velocidadLimite() //Si se excede, se queda en el limite.
	}
	
	method velocidadLimite(){
		if(velocidad > vLimite){velocidad= vLimite}
	}
}
/*---------------------------------------------------- */
class NaveCarga inherits Nave{
	var property masaDeCarga		//kilos
	
	method sobrecargada()= masaDeCarga > 100000
	
	method excesoVelocidad()= velocidad > 100000
	
	method esAmenazada(){
		if(amenaza){masaDeCarga= 0}
	} 
}

class NavePasajeros inherits Nave{
	var property pasajeros
	const personal = 4
	var property alarma= false
	var property velocidadLegal
	
	method esAmenazada(){alarma= true}
	
	method velocidadMaxLegal(){
		velocidadLegal = 300000 / (pasajeros + personal)
		if(pasajeros > 100){
			velocidadLegal -= 200
		}
		return velocidadLegal
	}
	
//	method enPeligro(){
//		if(alarma or velocidad > velocidadLegal){
//			return true
//		}else{
//			return false
//		}
//	}
	//Probando si anda esta forma
	method enPeligro()= alarma or (velocidad > velocidadLegal)
}

/*el modo es un objeto o simplemente lo defino con variable? 
Lo dejo en clase porque en teoria c/modo deberia tener cosas en comun
y luego cuestiones especificas de acuerdo a su tipo*/

class Modo{}
const reposo= new Modo()
const ataque= new Modo()

class NaveCombate inherits Nave{
	var property invisible= false
	var property modo
	var property armasNoDesplegadas = true
	
	/*es invisible cuando viaja a - 10000km en reposo
	 * o si no tiene armas desplegadas en ataque
	 */
	method esInvisible(){
		if(velocidad < 10000 and modo==reposo){
			invisible= true
		}else if(armasNoDesplegadas and modo==ataque){
			invisible= true
		}
	}
	
	method esAmenazada(){
		if(modo==reposo){
			console.println("Retirada!")
		}else if(modo==ataque){
			console.println("Enemigo encontrado!")
			armasNoDesplegadas= false //falso porque ahora SÍ las despliega
		}
	}
}






















