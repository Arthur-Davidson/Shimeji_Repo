//
//  chat_gato_en_frances.swift
//  Shimeji
//
//  Created by alumno on 5/4/26.
//

import SwiftUI

struct ChatView: View {
    @State var sesion_chat = ServicioChat()
    @State var mensajes_a_enviar: String = ""
    
    var body: some View {
        VStack{
            ForEach(sesion_chat.mensajes){
                mensaje in Text("El mensaje es: \(mensaje.texto) de parte de: \(mensaje.remitente)")
            }
            
            TextField("Cuentame que enviar", text: $mensajes_a_enviar)
            
            Button{
                sesion_chat.enviar_mensaje(texto: mensajes_a_enviar)
                mensajes_a_enviar = ""
            }label: {
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
