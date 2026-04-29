//
//  estado_salto.swift
//  Shimeji
//
//  Created by alumno on 4/20/26.
//

class SaltoAnimacion: Estado{
  
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    static let nombre = "Salto"

    
    func inicializar() {
        print("Hola desde la luna \(#file)")
    }
    
    func actualizar(_ tipo_interaccion: TiposDeInteraccion, _ interaccion: BotonesDisponibles) {
        switch tipo_interaccion{
            case .entidad:
                contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "da_un_salto"))
            
            default:
                print("Error: No tenemos instrucciones para ese comando")
        }
    }
    
    func finalizar() {}
    
    func reaccion(estimulo: String) {
    }
    
    
}




