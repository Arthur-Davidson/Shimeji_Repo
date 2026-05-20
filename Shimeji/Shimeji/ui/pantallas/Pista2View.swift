//
//  Pista2View.swift
//  Shimeji
//
//  Created by alumno on 5/20/26.
//

import SwiftUI

struct Pista2View: View {
    @Environment(ControladorAplicacion.self) var controlador

    var body: some View {
        PistaView(indice: 1)
    }
}
