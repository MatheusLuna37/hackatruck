//
//  ContentView.swift
//  aula03
//
//  Created by Turma02-20 on 23/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var peso: Double = 0
    @State private var altura: Double = 0
    @State private var imc: Double = 0
    @State private var cor: String = "normal"
    @State private var texto: String = "Normal"
    var body: some View {
        ZStack {
            Color(cor)
                .ignoresSafeArea()
            Text(texto)
                .font(.system(size: 40))
                .foregroundStyle(.white)
            VStack{
                VStack {
                    Text("Calculadora de IMC")
                        .font(.system(size: 40))
                    TextField("peso", value: $peso, format: .number)
                        .frame(height: 30)
                        .background(.white)
                        .cornerRadius(3)
                        .keyboardType(.decimalPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .padding([.horizontal], 40)
                    TextField("altura", value: $altura, format: .number)
                        .frame(height: 30)
                        .background(.white)
                        .cornerRadius(3)
                        .keyboardType(.decimalPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .padding([.horizontal], 40)
                }
                Button("Calcular") {
                    if (altura == 0) {
                        imc = 0
                    } else {
                        imc = peso/pow(altura, 2)
                    }
                    if (imc < 18.5) {
                        cor = "baixoPeso"
                        texto = "Baixo Peso"
                    } else if (imc < 25) {
                        cor = "normal"
                        texto = "Normal"
                    } else if (imc < 30) {
                        cor = "sobrepeso"
                        texto = "Sobrepeso"
                    } else {
                        cor = "obesidade"
                        texto = "Obesidade"
                    }
                }
                .frame(width: 100, height: 45)
                .background(.indigo)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding([.top])
                
                Spacer()
                
                Image("tabelaIMC")
                    .resizable()
                    .frame(width: 450, height: 250)
            }
        }
    }
}

#Preview {
    ContentView()
}
