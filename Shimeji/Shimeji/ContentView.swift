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
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack{
            Rectangle()
            VStack{
                switch controlador.estado{
                case .iniciando:
                    Text("Cargando...")
                        .foregroundStyle(Color.red)
                case .todo_cargado:
                    RealityView{ raiz_de_escena in
                        raiz_de_escena.add(controlador.raiz_escena)
                    }
                }

            }
        }
        
        Slider(value: $lejitud, in: 0...1)
            .onChange(of: lejitud){
                controlador.alejar_planetas(lejitud: lejitud)
            }
        Button{
            controlador.alejar_planetas(lejitud: lejitud)
        }
        label: {
            Text("Alejar planetas")
                .foregroundStyle(Color.green)
        }
    }
}

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
