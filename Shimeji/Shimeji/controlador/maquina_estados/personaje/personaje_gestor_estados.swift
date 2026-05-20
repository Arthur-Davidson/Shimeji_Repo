//
//  personaje_gestor_estados.swift
//  Shimeji
//
//  Created by alumno on 5/11/26.
//

class PersonajeGestorEstados: MaquinaEstadosGenerica {
    
    var controlador_general: (any ProcesarComandos)?
    
    // 🔥 FIX IMPORTANTE: evitar tipo circular problemático
    var contexto: AnyObject?
    
    var descripcion: String = "Gestor de estados del personaje"
    var posibles_estados: [String] = []
    
    static var nombre: String = "Gestor de estados basico"
    
    var estados_disponibles: [String: Estado] = [
        PersonajeNeutro.nombre: PersonajeNeutro(),
        PersonajeFeliz.nombre: PersonajeFeliz()
    ]
    
    var estado_actual: Estado? = nil
    var nombre_estado_actual: String = PersonajeNeutro.nombre
    
    init() {
        estado_actual = estados_disponibles[PersonajeNeutro.nombre]
        estado_actual?.contexto = self
        estado_actual?.inicializar()
    }
    
    func generar_contexto_textual() -> Contexto {
        
        let estados = estado_actual?.posibles_estados ?? []
        let descripcion = estado_actual?.descripcion ?? ""
        
        return Contexto(
            historia: "Eres un personaje llamado Joakin que busca ingredientes en el campus de IADA.",
            personalidad: "Amable, tímido y curioso",
            estados_disponibles: estados,
            estado_actual: nombre_estado_actual,
            descrpcion: descripcion,
            estado_agente: "neutral"
        )
    }
    
    func inicializar() { }
    
    func actualizar(_ tipo_interaccion: TiposDeInteraccion, _ interaccion: BotonesDisponibles) {
        estado_actual?.actualizar(tipo_interaccion, interaccion)
    }
    
    func finalizar() { }
    
    func reaccion(estimulo: String) { }
    
    func realizar_cambio_de_estado(a nombre_del_estado_nuevo: String) {
        
        guard let estado_nuevo = estados_disponibles[nombre_del_estado_nuevo] else {
            print("Estado no encontrado: \(nombre_del_estado_nuevo)")
            return
        }
        
        guard nombre_estado_actual != nombre_del_estado_nuevo else {
            return
        }
        
        estado_actual?.finalizar()
        
        nombre_estado_actual = nombre_del_estado_nuevo
        
        estado_nuevo.contexto = self   // ✅ FIX PRINCIPAL (sin cast raro)
        
        estado_nuevo.inicializar()
        
        estado_actual = estado_nuevo
    }
    
    func reaccionar_a_distancia(_ estado: String) {
        
        switch estado {
            
        case "lejos":
            realizar_cambio_de_estado(a: PersonajeNeutro.nombre)
            
        case "cerca":
            realizar_cambio_de_estado(a: PersonajeFeliz.nombre)
            
        case "punto":
            print("🔥 estado especial desbloqueado")
            
        default:
            break
        }
    }
}

