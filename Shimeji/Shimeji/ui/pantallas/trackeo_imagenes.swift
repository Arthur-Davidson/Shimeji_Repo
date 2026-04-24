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
            
            let ancla = AnchorEntity(.image(group: "imagenes", name: "logo_mcdonalds"))
            
            //let modelo_a_colocar = ModelEntity(mesh: .generateBox(size: 0.75), materials: [SimpleMaterial(color: .green, isMetallic: true)])
            
            let modelo_a_colocar = try? await Entity(named: "planetas", in: MundoVirtual){
                ancla.addChild(modelo_a_colocar)
            }
            
            //ancla.addChild(modelo_a_colocar)
            
            contenido.add(ancla)
        }
        
        
        .background(Color.black)
    }
}
