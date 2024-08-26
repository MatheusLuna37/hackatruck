//
//  ListaView.swift
//  aula04
//
//  Created by Turma02-20 on 23/08/24.
//

import SwiftUI

struct ListaView: View {
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Rosa")
                    Spacer()
                    Image(systemName: "paintbrush")
                }
                HStack {
                    Text("Azul")
                    Spacer()
                    Image(systemName: "paintbrush.pointed")
                }
                HStack {
                    Text("Cinza")
                    Spacer()
                    Image(systemName: "paintpalette")
                }
            }
            .navigationTitle("List")
        }
    }
}

#Preview {
    ListaView()
}
