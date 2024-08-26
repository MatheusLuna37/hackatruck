//
//  ContentView.swift
//  aula04.2
//
//  Created by Turma02-20 on 26/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemTeal)
                    .ignoresSafeArea()
                VStack {
                    Image("ragatanga")
                        .resizable()
                        .frame(width: 300, height: 150)
                    Spacer()
                    NavigationLink(destination: Modo1View()) {
                        Text("Modo 1")
                    }
                    .foregroundColor(.white)
                    .frame(width: 250,  height: 100)
                    .background(.pink)
                    .cornerRadius(7)
                    
                    NavigationLink(destination: Modo2View()) {
                        Text("Modo 2")
                    }
                    .foregroundColor(.white)
                    .frame(width: 250,  height: 100)
                    .background(.pink)
                    .cornerRadius(7)
                    
                    Button("Modo 3") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        Modo3View()
                    }
                    .foregroundColor(.white)
                    .frame(width: 250,  height: 100)
                    .background(.pink)
                    .cornerRadius(7)
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
