//
//  lista_pistas.swift
//  Shimeji
//
//  Created by alumno on 5/20/26.
//

import SwiftUI

struct ListaPistasView: View {
    
    @Environment(ControladorAplicacion.self)
    var controlador
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                // MARK: - Estado agente
                
                VStack {
                    
                    Text("Estado del agente")
                        .font(.headline)
                    
                    if controlador.controlador_pistas.jugador_cerca {
                        Text("📍 ESTÁS EN EL PUNTO")
                            .font(.title2)
                    }
                    else if controlador.controlador_pistas.distancia_actual < 100 {
                        Text("👀 ESTÁS CERCA")
                            .font(.title2)
                    }
                    else {
                        Text("🧭 ESTÁS LEJOS")
                            .font(.title2)
                    }
                }
                
                // MARK: - Distancia
                
                Text("""
                Distancia actual:
                \(Int(controlador.controlador_pistas.distancia_actual)) metros
                """)
                
                // MARK: - Lista de pistas CON NAVEGACIÓN
                
                List {
                    
                    ForEach(Array(controlador.controlador_pistas.pistas.enumerated()), id: \.offset) { index, pista in
                        
                        NavigationLink {
                            
                            switch index {
                                
                            case 0:
                                Pista1View()
                                
                            case 1:
                                Pista2View()
                                
                            case 2:
                                Pista3View()
                                
                            default:
                                Pista4View()
                            }
                            
                        } label: {
                            
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(pista.nombre)
                                        .font(.headline)
                                    
                                    Text(pista.descripcion)
                                        .font(.caption)
                                }
                                
                                Spacer()
                                
                                if pista.completada {
                                    Text("✅")
                                }
                                else if pista.desbloqueada {
                                    Text("🔓")
                                }
                                else {
                                    Text("🔒")
                                }
                            }
                        }
                        .disabled(!pista.desbloqueada)
                    }
                }
                
                // MARK: - Botón rápido de pista actual
                
                if controlador.controlador_pistas.jugador_cerca {
                    
                    Button {
                        
                        controlador.controlador_pistas.completar_pista_actual()
                        controlador.controlador_pistas.avanzar_pista()
                        
                    } label: {
                        
                        Text("COMPLETAR PISTA ACTUAL")
                            .font(.title2)
                            .padding()
                    }
                }
                
                // MARK: - Chatbot
                
                ChatView()
                    .frame(height: 200)
            }
            .padding()
        }
        // MARK: - Loop de actualización GPS
        
        .task {
            while true {
                
                controlador.actualizar_distancia_pistas()
                
                try? await Task.sleep(for: .seconds(2))
            }
        }
    }
}

#Preview {
    ListaPistasView()
        .environment(ControladorAplicacion())
}
