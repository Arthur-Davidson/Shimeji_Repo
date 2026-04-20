//
//  estado_salto.swift
//  Shimeji
//
//  Created by alumno on 4/20/26.
//

class SaltoAnimacion: Estado {
    var contexto: any MaquinaEstadosGenerica?
    
    static let nombre = "Salto"
    
    init(_ contexto: MaquinaEstadosGenerica){
        self.contexto = contexto
    }
    
    func inicializar() {
        
    }
    
    func actualizar(_ evento: String) {
        
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estado: String) {
        
    }
    
}
