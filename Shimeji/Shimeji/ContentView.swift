//
//  ContentView.swift
//  Shimeji
//
//  Created by alumno on 4/15/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

struct ContentView: View {
    @State var lejitud: Float = 0
    var body: some View {
        ZStack{
            Rectangle()
            RealityView{ raiz_de_escena in if let modelo_cubo = try? await Entity(named: "escena", in: mundo_virtualBundle) {
                modelo_cubo.position.z = Float(lejitud)
                raiz_de_escena.add(modelo_cubo)
                }
                
            }
        }
        
        Slider(value: $lejitud)
    }
}

#Preview {
    ContentView()
}
