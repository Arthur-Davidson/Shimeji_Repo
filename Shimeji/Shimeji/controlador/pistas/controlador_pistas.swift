//
//  controlador_pistas.swift
//  Shimeji
//
//  Created by alumno on 5/20/26.
//

import Foundation
import CoreLocation

@Observable
class ControladorPistas {
    
    // Lista de pistas
    var pistas: [Pista] = [
        
        Pista(
            nombre: "Pista 1: Pan",
            descripcion: "Frente al edificio V",
            latitud: 31.74214115572749,
            longitud: -106.43242005463796,
            desbloqueada: true,
            completada: false,
            distanciaActivacion: 20
        ),
        
        Pista(
            nombre: "Pista 2: Jamon",
            descripcion: "Atras del edificio C",
            latitud: 31.742436202377473,
            longitud: -106.43190564202764,
            desbloqueada: false,
            completada: false,
            distanciaActivacion: 20
        ),
        
        Pista(
            nombre: "Pista 3: Queso",
            descripcion: "A lado del edificio D",
            latitud: 31.742722163990504,
            longitud: -106.43142977046182,
            desbloqueada: false,
            completada: false,
            distanciaActivacion: 20
        ),
        
        Pista(
            nombre: "Pista 4: Mayonesa",
            descripcion: "Frente a la cafeteria",
            latitud: 31.742950277294696,
            longitud: -106.43245254340992,
            desbloqueada: false,
            completada: false,
            distanciaActivacion: 20
        )
    ]
    
    // Índice de pista actual
    var pista_actual: Int = 0
    
    // Distancia actual respecto a la pista
    var distancia_actual: Double = 9999
    
    // ¿Está dentro del rango?
    var jugador_cerca: Bool = false
    
    
    // Verificar distancia
    
    func verificar_distancia(
        latitud_usuario: Double,
        longitud_usuario: Double
    ) {
        
        guard pista_actual < pistas.count else {
            return
        }
        
        let pista = pistas[pista_actual]
        
        let ubicacion_usuario = CLLocation(
            latitude: latitud_usuario,
            longitude: longitud_usuario
        )
        
        let ubicacion_pista = CLLocation(
            latitude: pista.latitud,
            longitude: pista.longitud
        )
        
        let distancia = ubicacion_usuario.distance(
            from: ubicacion_pista
        )
        
        distancia_actual = distancia
        
        jugador_cerca = distancia <= pista.distanciaActivacion
    }
    
    
    // Completar pista
    
    func completar_pista_actual() {
        
        guard pista_actual < pistas.count else {
            return
        }
        
        pistas[pista_actual].completada = true
        
        let siguiente = pista_actual + 1
        
        if siguiente < pistas.count {
            pistas[siguiente].desbloqueada = true
        }
    }
    
    
    // Avanzar a siguiente pista
    
    func avanzar_pista() {
        
        if pista_actual + 1 < pistas.count {
            pista_actual += 1
        }
    }
}
