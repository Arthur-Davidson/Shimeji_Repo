//
//  servicio_agente.swift
//  Shimeji
//
//  Created by alumno on 5/6/26.
//

import FirebaseFirestore
import Combine

@Observable
class ServicioAgente{
    // var peticion: Peticion? = nil
    var peticion_id: String? = nil
    var peticion: Peticion? = nil
    
    private var base_de_datos = Firestore.firestore()
    
    func obtener_actualziaciones_de_la_peticion(){
        base_de_datos.collection("peticiones/")
            .addSnapshotListener { snapshot, error in
                guard let documento = snapshot?.documents else {
                    print("NO se recibieron documentos en plural")
                    return
                }
                var peticiones = documento.compactMap{ elemento in
                     try? elemento.data(as: Peticion.self)
                }
                
                for peticion in peticiones{
                    if peticion.id == self.peticion_id {
                        self.peticion = peticion
                    }
                }
                
                print("EL documento es \(documento)")
        }
    }
    
    func crear_peticion(){
        let contexto = Contexto(
            historia: "Eres un asesino con la cara cubierta, tus amigos te dicen GhostFace",
            personalidad: "Persona agradable con sus amigos, un horror para los demas",
            acciones_disponibles: ["insultar", "agredir"],
            estados_disponibles: ["nuestro_2", "sujeto buena onda"],
            estado_emocional: "Feliz"
        )
        
        let peticion = Peticion(
            id: UUID().uuidString,
            estado: .creacion,
            contexto: contexto,
            mensaje: "WAZAAAA",
            animacion: nil,
            comando_a_ejecutar: nil,
            respuesta: nil
        )
        
        do{
            var resultado_enviar_peticion = try base_de_datos.collection("peticiones").addDocument(from: peticion)
            print("El resultado de enviar la peticion es: \(resultado_enviar_peticion.documentID)")
            obtener_actualziaciones_de_la_peticion()
            self.peticion_id = peticion.id
            
            
        }
        catch {
            print("Hey, tiene un error \(error)")
        }
    }
}
