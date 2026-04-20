//
//  gestor_maquina_estados.swift
//  Shimeji
//
//  Created by alumno on 4/20/26.
//

protocol MaquinaEstadosGenerica {
    func realizar_cambio_estado(nombre_del_estado_nuevo: String) -> Void
    
    func actualizar(_ evento: String) -> Void
}

