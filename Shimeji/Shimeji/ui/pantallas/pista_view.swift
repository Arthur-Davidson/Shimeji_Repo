//
//  pista_view.swift
//  Shimeji
//
//  Created by alumno on 5/20/26.
//

import SwiftUI

struct PistaView: View {
    
    @Environment(ControladorAplicacion.self)
    var controlador
    
    var indice: Int
    
    var body: some View {
        
        let pista = controlador.controlador_pistas.pistas[indice]
        
        VStack(spacing: 20) {
            
            Text(pista.nombre)
                .font(.largeTitle)
            
            Text(pista.descripcion)
                .font(.title3)
                .multilineTextAlignment(.center)
            
            Divider()
            
            Text("Estado:")
                .font(.headline)
            
            if pista.completada {
                Text("✅ Completada")
            } else if pista.desbloqueada {
                Text("🔓 Disponible")
            } else {
                Text("🔒 Bloqueada")
            }
            
            Divider()
            
            ChatView()
                .frame(height: 200)
            
            Button {
                
                controlador.controlador_pistas
                    .completar_pista_actual()
                
                controlador.controlador_pistas
                    .avanzar_pista()
                
            } label: {
                
                Text("Marcar como completada")
                    .padding()
            }
        }
        .padding()
    }
}
