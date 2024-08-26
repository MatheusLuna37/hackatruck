//
//  Modo2View.swift
//  aula04.2
//
//  Created by Turma02-20 on 26/08/24.
//

import SwiftUI

struct Modo2View: View {
    @State private var nome: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemTeal)
                    .ignoresSafeArea()
                VStack {
                    Text("Modo 2")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding([.top], 30)
                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.pink)
                            .frame(width: 350, height: 250)
                        VStack (alignment: .center) {
                            TextField("", text: $nome)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding([.top], 20)
                            Text("Bem vindo, \(nome)")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                            NavigationLink (destination: Modo2_View(nome: self.$nome)) {
                                Text("Acesar Tela")
                            }
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 110, height: 40)
                            .background(.blue)
                            .cornerRadius(5)
                            .padding([.top], 50)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    Modo2View()
}
