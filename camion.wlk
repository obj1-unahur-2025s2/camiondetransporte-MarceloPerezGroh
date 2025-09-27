import cosas*.

object camion {
    const carga = []

    method carga(unaCosa) {
        carga.add(unaCosa)
    }
    method descarga(unaCosa){
        carga.remove(unaCosa)
    }

    method pesoTotal(){
        1000 + carga.sum()
    }
    
    //even para saber si es par
    method esCargaPar() {
        carga.all({cosas => cosas.peso().even()})
    }
    
    method algunaCosaPesoEsto(unPeso) {
        carga.any({cosas => cosas.peso()== unPeso})
    }
    //find devuelve el primero
    method primeraCarga(nivelPeligrosidad){
        carga.find({cosas => nivelPeligrosidad == cosas.peligrosidad()})
    }
    method todasLasCosasConMasPeligrosidad(nivelPeligrosidad){
        carga.filter({cosas => cosas.peligrosidad() == nivelPeligrosidad })
    }
    method superanElNivelDePeligrosidad(nivelDePeligrosidad){
        carga.filter({cosas => cosas.peligrosidad() > nivelDePeligrosidad})
    }
    method exedeElPeso(){
        carga.pesoTotal() > 2500
    }
    method puedeCircular(nivelPeligrosidad) {
        !self.exedeElPeso() &&
        self.todasLasCosasConMasPeligrosidad(nivelPeligrosidad).isEmpty()
    }
    method algunaCosaPesaEntre(valorMin , valorMax){
        carga.any({cosas => cosas.peso().between(valorMin, valorMax)})
    }
    method cosaMasPesada() {
        carga.max({cosas => cosas.peso()})
    } 
}
