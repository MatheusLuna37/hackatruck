//
//  Modo3View.swift
//  aula04.2
//
//  Created by Turma02-20 on 26/08/24.
//

import SwiftUI

struct Modo3View: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            VStack {
                Text("Modo 3")
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
                    VStack (alignment: .center) {            Text("Nome: Isadora")
                            .foregroundColor(.white)
                        Text("Sobrenome: Mendonça")
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Modo3View()
}
