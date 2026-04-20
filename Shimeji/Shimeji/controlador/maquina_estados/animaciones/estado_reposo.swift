//
//  estado_reposo.swift
//  Shimeji
//
//  Created by alumno on 4/20/26.
//

class ReposoAnimacion: Estado {
    var contexto: any MaquinaEstadosGenerica?
    
    static let nombre: String = "Reposo"
    
    
    func inicializar() {}
    
    func actualizar(_ evento: String) {
        print("")
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estado: String) {
        
    }
}
