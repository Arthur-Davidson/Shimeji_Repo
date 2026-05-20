//
//  gestor_maquina_estados.swift
//  Shimeji
//
//  Created by alumno on 4/20/26.
//

import Foundation

// PROTOCOLO BASE DE MÁQUINA DE ESTADOS
protocol MaquinaEstadosGenerica: AnyObject {

    var controlador_general: ProcesarComandos? { get set }

    var estados_disponibles: [String: Estado] { get set }

    var estado_actual: Estado? { get set }

    func realizar_cambio_de_estado(a nombre: String)

    func enviar_peticion(_ comando: Comando) -> Bool
}

// MARK: - EXTENSIÓN FUNCIONAL (LÓGICA REUTILIZABLE)
extension MaquinaEstadosGenerica {

    func realizar_cambio_de_estado(a nombre_del_estado_nuevo: String) {

        guard let estado_nuevo = estados_disponibles[nombre_del_estado_nuevo] else {
            print("Estado no encontrado: \(nombre_del_estado_nuevo)")
            return
        }

        // Finalizar estado actual
        estado_actual?.finalizar()

        // Cambiar contexto
        estado_nuevo.contexto = self

        // Inicializar nuevo estado
        estado_nuevo.inicializar()

        // Asignar como actual
        estado_actual = estado_nuevo
    }

    func enviar_peticion(_ comando: Comando) -> Bool {
        return controlador_general?.realizar_comando(comando) ?? false
    }
}





