//
//  TabScreenView.swift
//  aula04
//
//  Created by Turma02-20 on 23/08/24.
//

import SwiftUI

struct TabScreenView: View {
    var body: some View {
        TabView () {
            RosaView()
                .tabItem { 
                    Label("Rosa", systemImage: "paintbrush.fill")
                }
            
            AzulView()
                .tabItem { 
                    Label("Rosa", systemImage: "paintbrush.pointed.fill")
                }
            
            CinzaView()
                .tabItem { 
                    Label("Cinza", systemImage: "paintpalette.fill")
                }
            
            ListaView()
                .tabItem {
                    Label("Lista", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    TabScreenView()
}
