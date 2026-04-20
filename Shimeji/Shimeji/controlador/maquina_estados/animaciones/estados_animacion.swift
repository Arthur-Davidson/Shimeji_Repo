//
//  estados_animacion.swift
//  Shimeji
//
//  Created by alumno on 4/20/26.
//

class MaquinaEstadosAnimacion: MaquinaEstadosGenerica {
    var estados_disponibles: [String: Estado] = [
        ReposoAnimacion.nombre: ReposoAnimacion(),
        SaltoAnimacion.nombre: SaltoAnimacion()
        
    ]
    
    var estado_actual: Estado? = nil
    
    init(){
        estado_actual = estados_disponibles[ReposoAnimacion.nombre]
        estado_actual?.contexto
        
    }
    
    func realizar_cambio_estado(nombre_del_estado_nuevo: String) {
        guard let estado_nuevo = estados_disponibles[nombre_del_estado_nuevo] else {
            fatalError("Parece que el estado \(nombre_del_estado_nuevo) no esta disponible o registrado, por favor revisa.")
        }
        
        estado_actual?.finalizar()
        
        estado_nuevo.inicializar()
        
        estado_actual = estado_nuevo
    }
    
    func actualizar(_ evento: String) {
        estado_actual?.actualizar(evento)
    }
    
}

