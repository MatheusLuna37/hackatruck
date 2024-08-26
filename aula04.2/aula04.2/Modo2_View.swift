//
//  Modo2_View.swift
//  aula04.2
//
//  Created by Turma02-20 on 26/08/24.
//

import SwiftUI

struct Modo2_View: View {
    
    @Binding var nome: String
    
    var body: some View {
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
                        .frame(width: 250, height: 150)
                    VStack {
                        Text("Volte,")
                            .foregroundStyle(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        Text("\(nome)")
                            .foregroundStyle(.white)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
                
                Spacer()
            }
        }
    }
}

