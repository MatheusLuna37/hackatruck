//
//  SongView.swift
//  aula05
//
//  Created by Turma02-20 on 27/08/24.
//

import SwiftUI

struct SongView: View {
    var index: Int
    var prox: Int
    var ant: Int
    init(index: Int) {
        self.index = index
        if index+1 < arrayMusicas.count {
            self.prox = index+1
        } else {
            self.prox = index
        }
        if index-1 >= 0 {
            self.ant = index-1
        } else {
            self.ant = index
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black, Color.black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    AsyncImage(url: URL(string: arrayMusicas[index].cover)) { image in
                        image.resizable()
                            .frame(width: 210, height: 210)
                    } placeholder: {
                    }
                    Text(arrayMusicas[index].name)
                        .foregroundStyle(.white)
                    Text(arrayMusicas[index].artist)
                        .foregroundStyle(.white)
                    Spacer()
                    HStack {
                        Image(systemName: "shuffle")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                        Spacer()
                        NavigationLink(destination: SongView(index: ant)) {
                            Image(systemName: "backward.end.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        }
                        Spacer()
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 60))
                        Spacer()
                        NavigationLink(destination: SongView(index: prox)) {
                            Image(systemName: "forward.end.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        }
                        Spacer()
                        Image(systemName: "repeat")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SongView(index: 1)
}
