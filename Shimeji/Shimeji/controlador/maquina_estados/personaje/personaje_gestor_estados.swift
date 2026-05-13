//
//  personaje_gestor_estados.swift
//  Shimeji
//
//  Created by alumno on 5/11/26.
//

class PersonajeGestorEstados: MaquinaEstadosGenerica{
    var controlador_general: (any ProcesarComandos)?
    
    var contexto: (any MaquinaEstadosGenerica)?
    
    var descripcion: String = "Esta no la vamos a tomar en cuenta"
    
    var posibles_estados: [String] = []
    
    static var nombre: String = "Gestor de estados basico"
    
    var estados_disponibles: [String: Estado] = [
        PersonajeNeutro.nombre: PersonajeNeutro(),
        PersonajeFeliz.nombre: PersonajeFeliz()
    ]
    
    var estado_actual: Estado? = nil
    var nombre_estado_actual: String?
    
    init(){
        realizar_cambio_de_estado(a: PersonajeNeutro.nombre)
        
        estado_actual?.contexto = self
    }
    
    func generar_contexto_textual() -> Contexto {
        print("Traza")
        
        let contexto_actual = Contexto(
            historia: "Eres un personaje llamado Joakin que tiene antojo de una torta de jamon pero necesitas ayuda del usuario para obtener los ingredientes alrededor del campus de IADA, duarnte el recorrido deberan encontrar 4 ingredientes esenciales para poder conseguirla, estos ingredientes se encuentran en diferentes lugares del campus y otro personaje llamado Pablo el carnicero, quien sera el que ponga acertijos en cada punto de encuentro",
            personalidad: "Amable, pero un poco tímido y esta algo confuncido por por el lugar en donde estan",
            estados_disponibles: estado_actual!.posibles_estados,
            estado_actual: nombre_estado_actual!,
            descrpcion: estado_actual!.descripcion
        )
        
        return contexto_actual
    }

    func inicializar() { }
    
    func actualizar(_ tipo_interaccion: TiposDeInteraccion, _ interaccion: BotonesDisponibles) {
        estado_actual?.actualizar(tipo_interaccion, interaccion)
    }
    
    func finalizar() { }
    
    func reaccion(estimulo: String) { }
    
    func realizar_cambio_de_estado(a nombre_del_estado_nuevo: String) {
        guard var estado_nuevo = estados_disponibles[nombre_del_estado_nuevo] else {
            fatalError("Parece que el estado \(nombre_del_estado_nuevo) no esta disponible o registrado, por favor revisa.")
        }
        
        nombre_estado_actual = nombre_del_estado_nuevo
        
        estado_actual?.finalizar()
        
        estado_nuevo.contexto = self as MaquinaEstadosGenerica
        estado_nuevo.inicializar()
        
        estado_actual = estado_nuevo
    }
    
}

