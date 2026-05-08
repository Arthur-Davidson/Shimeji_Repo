//
//  chat_gato_en_frances.swift
//  Shimeji
//
//  Created by alumno on 5/4/26.
//

import SwiftUI

struct ChatView: View {
    @State var sesion_chat = ServicioChat()
    @State var sesion_agente = ServicioAgente()
    @State var mensaje_a_enviar: String = ""
    
    var body: some View {
        VStack{
            ForEach(sesion_chat.mensajes){mensaje in
                Text("El mensajes es: \(mensaje.texto) de parte de: \(mensaje.remitente)")
                
            }
            
            Text("La respuesta del agente fue: \(sesion_agente.peticion?.respuesta)")
            
            TextField("Cuentame que enviar", text: $mensaje_a_enviar)
            
            Button{
                sesion_agente.crear_peticion()
            } label: {
                Text("Pulsame para enviar cosas")
            }
            
        }
        .onAppear {
            sesion_chat.obtner_mensajes()
        }
    }
}

#Preview {
    ChatView()
}

