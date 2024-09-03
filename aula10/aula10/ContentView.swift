//
//  ContentView.swift
//  Aula07
//
//  Created by Turma02-20 on 30/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var view = ViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.gray)
                    .ignoresSafeArea()
                    .opacity(0.5)
                ScrollView {
                    VStack {
                        Text("Estacionamentos Disponíveis")
                            .padding()
                            .font(.system(size: 30))
                        ForEach(view.estacionamento, id: \._id) { item in
                            NavigationLink(destination: EstacionamentoView(estacionamento: item)) {
                                HStack {
                                    Text(item.nomeEstacionamento)
                                        .padding([.horizontal])
                                    Spacer()
                                    Text("\(item.quantidadeVagas)")
                                        .padding([.horizontal])
                                }
                                .frame(height: 100)
                                .background(.white)
                                .padding([.horizontal], 10)
                            }
                        }
                    }
                    .onAppear(){
                        view.fetch()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
