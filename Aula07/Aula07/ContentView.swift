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
                        Text("Lista de Comentários")
                            .padding()
                            .font(.system(size: 30))
                        ForEach(view.comms) { item in
                            NavigationLink(destination: CommentView(comm: item)) {
                                HStack {
                                    if item.name != nil {
                                        Text(item.name!)
                                            .padding([.horizontal])
                                    }
                                    Spacer()
                                    if item.email != nil {
                                        Text(item.email!)
                                            .padding([.horizontal])
                                    }
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
