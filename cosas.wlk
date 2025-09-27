object cosas {
    
}

object knightRider{
    method peso() = 500
    method nivelDePeligrosidad() = 10
    method esPesoPar() = self.peso().even()
}

object bumblebee{
    var esAuto = true
    var esRobot = false
    method estaTransformadoEnAuto() {
        esAuto = true
    }
    method estaTransformadoRobot() {
        esRobot = false
    } 
    method peso() = 800
    method esPesoPar() = self.peso().even()
    method peligrosidad() = if(esAuto) 15 else 30
}

object ladrillos{
    var cantidad = 11
    method peso() = 2
    method cantidadDeLadrillos(nuevaCantidad) {
        cantidad = nuevaCantidad
    } 
    method nivelDePeligrosidad() = 2
}

object arena {
    var peso = 1
    method peso(nuevoPeso){
        peso = nuevoPeso
    } 
    method nivelDePeligrosidad() = 1
}

object bateriaAntiaerea {
    var tieneMisiles = true
     method estaCargadoConMisiles() {
        tieneMisiles = true
    } 
    method peso() = if(tieneMisiles) 300 else 200 
    method peligrosidad() {
        if(tieneMisiles){
            100
        }else{
            0
        }
    }
}

object contenedorPortuario {
    const cosas =  []
    method agregarCosas(nuevaCosa) {
        cosas.add(nuevaCosa)
    }
    method quitarUnaCosa(nuevaCosa) {
        cosas.remove(nuevaCosa)
    } 
    method peso() {
        100 + cosas.sum({cosas => cosas.peso()})
    } 
    method peligrosidad() { return
        if(cosas.isEmpty()){
             0
        }else{
            cosas.max({cosas => cosas.peligrosidad()}).peligrosidad()
        }
    }
}

object residuosRadiactivos {
    var property peso = 0
    method peligrosidad() = 200 
}

object embalajeDeSeguridad {
    const cosas = arena
    
    method peso() {
        cosas.peso()
    }
    method peligrosidad() {
        cosas.peligrosidad() / 2
    } 
}