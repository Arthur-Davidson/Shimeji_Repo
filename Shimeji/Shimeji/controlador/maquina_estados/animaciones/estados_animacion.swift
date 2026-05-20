//
//  estados_animacion.swift
//  Shimeji
//
//  Created by alumno on 4/20/26.
//


import Foundation

class MaquinaEstadosAnimacion: MaquinaEstadosGenerica {

    // PROTOCOLO
    var controlador_general: ProcesarComandos?

    var estados_disponibles: [String: Estado] = [
        ReposoAnimacion.nombre: ReposoAnimacion(),
        SaltoAnimacion.nombre: SaltoAnimacion(),
        PlanetasDesaparecidos.nombre: PlanetasDesaparecidos()
    ]

    var estado_actual: Estado? = nil

    // DESCRIPCIÓN
    var descripcion: String = "Máquina de estados de animación"

    // INIT
    init() {
        let estado_inicial = estados_disponibles[ReposoAnimacion.nombre]
        estado_actual = estado_inicial

        estado_actual?.contexto = self
        estado_actual?.inicializar()
    }

    // MARK: - DEBUG / INFO
    func generar_descripcion() -> String {
        return descripcion
    }

    func generar_contexto_textual() -> Contexto {
        Contexto(
            historia: "Sistema de animación del personaje",
            personalidad: "Responde a interacciones del usuario",
            estados_disponibles: Array(estados_disponibles.keys),
            estado_actual: type(of: estado_actual!).nombre,
            descripcion: estado_actual?.descripcion ?? "",
            estado_agente: "neutral"
        )
    }
}






