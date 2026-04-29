//
//  estado_planetas_desaparecidos.swift
//  Shimeji
//
//  Created by alumno on 4/20/26.
//

class PlanetasDesaparecidos: Estado{

    var contexto: (any MaquinaEstadosGenerica)?
    static let nombre = "Planetas desaparecidos"
    
    func inicializar() {
        
    }
    
    func actualizar(_ tipo_interaccion: TiposDeInteraccion, _ interaccion: BotonesDisponibles) {
        print("Hola desde planetas desaparecidos")
    }
    
    
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
    
}




