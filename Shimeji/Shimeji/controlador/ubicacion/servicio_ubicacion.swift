//
//  servicio_ubicacion.swift
//  Shimeji
//
//  Created by alumno on 5/20/26.
//

import Foundation
import CoreLocation

@Observable
class ServicioUbicacion: NSObject, CLLocationManagerDelegate {
    
    private let administrador_ubicacion = CLLocationManager()
    
    // Coordenadas actuales del usuario
    var latitud: Double = 0
    var longitud: Double = 0
    
    // ¿Ya dio permisos?
    var permisos_otorgados: Bool = false
    
    
    override init() {
        super.init()
        
        administrador_ubicacion.delegate = self
        
        administrador_ubicacion.desiredAccuracy = kCLLocationAccuracyBest
        
        administrador_ubicacion.requestWhenInUseAuthorization()
        
        administrador_ubicacion.startUpdatingLocation()
    }
    
    
    // MARK: - Actualización de ubicación
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        
        guard let ubicacion = locations.last else {
            return
        }
        
        latitud = ubicacion.coordinate.latitude
        longitud = ubicacion.coordinate.longitude
        
        print("""
        Nueva ubicación:
        Latitud: \(latitud)
        Longitud: \(longitud)
        """)
    }
    
    
    // MARK: - Permisos
    
    func locationManagerDidChangeAuthorization(
        _ manager: CLLocationManager
    ) {
        
        switch manager.authorizationStatus {
            
        case .authorizedAlways,
             .authorizedWhenInUse:
            
            permisos_otorgados = true
            
            administrador_ubicacion.startUpdatingLocation()
            
        default:
            permisos_otorgados = false
        }
    }
}
