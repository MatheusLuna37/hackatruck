//
//  ContentView.swift
//  aula05
//
//  Created by Turma02-20 on 27/08/24.
//

import SwiftUI

struct Song : Identifiable {
    var id: Int
    var name: String
    var artist: String
    var cover: String
}

var arrayMusicas = [
    Song(id: 1, name: "Blank Space", artist: "Taylor Swift", cover: "https://upload.wikimedia.org/wikipedia/pt/1/10/Capa_de_Blank_Space.png"),
    Song(id: 2, name: "Style", artist: "Taylor Swift", cover: "https://upload.wikimedia.org/wikipedia/pt/thumb/4/41/Taylor_Swift_-_Style.png/220px-Taylor_Swift_-_Style.png"),
    Song(id: 3, name: "Don't Blame Me", artist: "Taylor Swift", cover: "https://i.scdn.co/image/ab67616d0000b273da5d5aeeabacacc1263c0f4b"),
    Song(id: 4, name: "cardigan", artist: "Taylor Swift", cover: "https://i.scdn.co/image/ab67616d0000b27395f754318336a07e85ec59bc"),
    Song(id: 5, name: "Enchanted", artist: "Taylor Swift", cover: "https://i.scdn.co/image/ab67616d0000b273e11a75a2f2ff39cec788a015"),
    Song(id: 6, name: "Cruel Summer", artist: "Taylor Swift", cover: "https://i.scdn.co/image/ab67616d0000b273b40f953d9ebdc956544e28a5"),
    Song(id: 7, name: "Paper Rings", artist: "Taylor Swift", cover: "https://i.scdn.co/image/ab67616d0000b273b40f953d9ebdc956544e28a5"),
    Song(id: 8, name: "Shake It Off", artist: "Taylor Swift", cover: "https://upload.wikimedia.org/wikipedia/pt/d/d1/Capa_de_Shake_It_Off.jpg"),
    Song(id: 9, name: "Wildest Dreams", artist: "Taylor Swift", cover: "https://i.scdn.co/image/ab67616d0000b273eb10050f6fe8e2783a91a4b1"),
]

var recomendadas = [
    Song(id: 10, name: "You Belong With Me(Taylor`s Version)", artist: "Taylor Swift", cover: "https://upload.wikimedia.org/wikipedia/pt/b/b9/Taylor_Swift_-_You_Belong_with_Me.png"),
    Song(id: 11, name: "Bejeweled", artist: "Taylor Swift", cover: "https://upload.wikimedia.org/wikipedia/pt/7/7b/Taylor_Swift_-_Bejeweled.png"),
    Song(id: 12, name: "All Too Well(Taylor's Version)", artist: "Taylor Swift", cover: "https://i.scdn.co/image/ab67616d0000b273318443aab3531a0558e79a4d"),
    Song(id: 13, name: "London Boy", artist: "Taylor Swift", cover: "https://i.scdn.co/image/ab67616d0000b273e787cffec20aa2a396a61647"),
    Song(id: 14, name: "New Romantics", artist: "Taylor Swift", cover: "https://upload.wikimedia.org/wikipedia/pt/4/47/Taylor_Swift_-_New_Romantics.png"),
]

struct ContentView: View {
    @State private var currentId: Int = 0
             
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black, Color.black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
    
                VStack {
                    ScrollView {
                        Image("caminhao")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding([.top], 50)
                            .padding([.bottom], 30)
                        HStack {
                            Text("HackaFM")
                                .foregroundStyle(.white)
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .padding([.horizontal])
                            Spacer()
                        }
                        HStack {
                            Image("caminhao")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("HackaSong")
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding([.horizontal])
                        .padding([.bottom])
                        ForEach (arrayMusicas) { musica in
                            NavigationLink(destination: SongView(song: musica, array: arrayMusicas)) {
                                HStack {
                                    AsyncImage(url: URL(string: musica.cover)) { image in
                                        image.resizable()
                                            .frame(width: 60, height: 60)
                                    } placeholder: {
                                    }
                                    VStack (alignment: .leading){
                                        Text(musica.name)
                                            .foregroundStyle(.white)
                                            .fontWeight(.bold)
                                        Text(musica.artist)
                                            .foregroundStyle(.white)
                                    }
                                    Spacer()
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.white)
                                }
                                .padding([.horizontal], 3)
                                .padding([.top], 5)
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("Sugeridos")
                                .font(.system(size: 35))
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach (recomendadas) { musica in
                                        NavigationLink(destination: SongView(song: musica, array: recomendadas)) {
                                            VStack {
                                                AsyncImage(url: URL(string: musica.cover)) { image in
                                                    image.resizable()
                                                        .frame(width: 200, height: 200)
                                                } placeholder: {
                                                }
                                                Text(musica.name)
                                                    .foregroundStyle(.white)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
