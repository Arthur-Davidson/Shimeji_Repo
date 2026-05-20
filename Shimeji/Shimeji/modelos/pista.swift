//
//  pista.swift
//  Shimeji
//
//  Created by alumno on 5/20/26.
//

import Foundation
import CoreLocation

struct Pista: Identifiable, Codable {
    
    var id = UUID()
    
    // Nombre corto de la pista
    var nombre: String
    
    // Descripción que verá el jugador
    var descripcion: String
    
    // Coordenadas del lugar
    var latitud: Double
    var longitud: Double
    
    // Estado de la pista
    var desbloqueada: Bool
    var completada: Bool
    
    // Distancia mínima para activar la pista
    var distanciaActivacion: Double
    
    // Helper
    var coordenada: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitud,
            longitude: longitud
        )
    }
}
