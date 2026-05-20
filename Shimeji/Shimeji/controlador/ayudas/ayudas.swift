//
//  ayudas.swift
//  Shimeji
//
//  Created by alumno on 4/27/26.
//

enum BotonesDisponibles{
    case realizar_accion
    case cerrar_aplicacion
    case so_on_so_on
}

enum TiposDeInteraccion{
    case entidad
    case boton
    case notificacion
}

enum AccionesARealizar: String, Codable {
    case abrir_pantalla
    case avanzar_historia
}

public enum PantallasDisponibles: String, Codable {
    case lista_pistas
    
    case pista_1
    case pista_2
    case pista_3
    case pista_4
}






