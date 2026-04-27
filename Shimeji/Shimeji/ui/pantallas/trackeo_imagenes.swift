//
//  trackeo_imagenes.swift
//  Shimeji
//
//  Created by alumno on 4/24/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

struct SeguimientoImagenes: View {
    var body: some View {
        RealityView{ contenido in
            contenido.camera = .spatialTracking
            
            let ancla = AnchorEntity(.image(group: "imagenes", name: "maik_wazoski") )
            
            // let modelo_a_colocar = ModelEntity(mesh: .generateBox(size: 0.75), materials: [SimpleMaterial(color: .green, isMetallic: true)])
            if let modelo_a_colocar = try? await Entity(named: "planetario/escena", in: MundoVirtual){
                ancla.addChild(modelo_a_colocar)
            }
            else {
                fatalError("aqui no hay algo")
            }
            
            contenido.add(ancla)
        }
        // Este cacho es nuevo
        .gesture(SpatialTapGesture().targetedToAnyEntity().onEnded({
            accion_realizada in print("Accion realizada es: \(accion_realizada.entity)")
        }))
        //
        .gesture(SpatialTapGesture().targetedToAnyEntity().onEnded({ entidad_apachurrada in
           print("Se ha pulsado \(entidad_apachurrada)")
        }))
                 
            
        .background(Color.black)
    }
}

#Preview {
    SeguimientoImagenes()
}


