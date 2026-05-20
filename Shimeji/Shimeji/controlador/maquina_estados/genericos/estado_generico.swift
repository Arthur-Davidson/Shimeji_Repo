//
//  estado_generico.swift
//  Shimeji
//
//  Created by alumno on 4/20/26.
//

import Foundation

// ESTADO BASE
protocol Estado: AnyObject {

    // referencia a la máquina (SIN AnyObject)
    var contexto: MaquinaEstadosGenerica? { get set }

    var descripcion: String { get set }

    var posibles_estados: [String] { get set }

    static var nombre: String { get }

    func inicializar()

    func actualizar(_ tipo_interaccion: TiposDeInteraccion,
                    _ interaccion: BotonesDisponibles)

    func finalizar()

    func reaccion(estimulo: String)
}





