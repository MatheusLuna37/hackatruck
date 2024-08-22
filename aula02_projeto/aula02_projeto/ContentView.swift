//
//  ContentView.swift
//  aula02_projeto
//
//  Created by Turma02-20 on 22/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var fulano: String = ""
    @State private var showingAlert: Bool = false
    var body: some View {
        ZStack {
            Image("caminhao_fundo")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            Color(.white)
                .ignoresSafeArea()
                .opacity(showingAlert ? 0.5 : 0.7)

            
            VStack {
                VStack {
                    Text("Bem vindo, \(fulano)")
                        .font(.system(size: 40))
                    TextField("", text: $fulano)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .shadow(radius: 10)
                    Image("caminhao")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                }
                
                Spacer()
                
                Button("Entrar") {
                    showingAlert = true
                }
                .foregroundColor(.black)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("ALERTA!"), message: Text("Você irá iniciar o desafio."), dismissButton: .default(Text("Vamos lá!"))
                    )
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
