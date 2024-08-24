//
//  ListaView.swift
//  aula04
//
//  Created by Turma02-20 on 23/08/24.
//

import SwiftUI

struct ListaView: View {
    var body: some View {
        VStack {
            NavigationStack {
                ZStack {
                    Color(.gray)
                        .opacity(0.2)
                        .ignoresSafeArea()
                    VStack {
                        Text("Lista")
                            .font(.title)
                            .multilineTextAlignment(.leading)
                        VStack {
                            NavigationLink (destination: RosaView()) {
                                HStack {
                                    Text("Rosa")
                                    Spacer()
                                    Image(systemName: "paintbrush")
                                }
                                .frame(height: 50)
                                .padding([.horizontal])
                            }
                            .background(.white)
                            .padding([.horizontal])
                            
                            NavigationLink (destination: AzulView()) {
                                HStack {
                                    Text("Azul")
                                    Spacer()
                                    Image(systemName: "paintbrush.pointed")
                                }
                                .frame(height: 50)
                                .padding([.horizontal])
                            }
                            .background(.white)
                            .padding([.horizontal])
                            
                            NavigationLink (destination: CinzaView()) {
                                HStack {
                                    Text("Cinza")
                                    Spacer()
                                    Image(systemName: "paintpalette")
                                }
                                .frame(height: 50)
                                .padding([.horizontal])
                            }
                            .background(.white)
                            .padding([.horizontal])
                        }
                        Spacer()
                    }
                    .padding([.top], 50)
                }
            }
        }
    }
}

#Preview {
    ListaView()
}
