//
//  SongView.swift
//  aula05
//
//  Created by Turma02-20 on 27/08/24.
//

import SwiftUI
import AVKit
import AVFAudio
import AVFoundation

struct SongView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var song: Song
    @State var playingSong: Bool = false
    @State var icon: String = "play.fill"
    var array:[Song]
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black, Color.black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    AsyncImage(url: URL(string: song.cover)) { image in
                        image.resizable()
                            .frame(width: 210, height: 210)
                    } placeholder: {
                    }
                    Text(song.name)
                        .foregroundStyle(.white)
                    Text(song.artist)
                        .foregroundStyle(.white)
                    Spacer()
                    HStack {
                        Image(systemName: "shuffle")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                        Spacer()
                        Button(action: {
                            song = array[((array.firstIndex(where: { $0.id == song.id }) ?? 0)-1+array.count)%(array.count)]
                        }, label: {
                            Image(systemName: "backward.end.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        })
                        Spacer()
                        Button(action: {
                            if playingSong {
                                self.audioPlayer.pause()
                                icon = "play.fill"
                            } else {
                                self.audioPlayer.play()
                                icon = "pause.fill"
                            }
                            playingSong.toggle()
                        }) {
                            Image(systemName: icon)
                                .foregroundColor(.white)
                                .font(.system(size: 60))
                        }
                        Spacer()
                        Button(action: {
                            song = array[((array.firstIndex(where: { $0.id == song.id }) ?? 0)+1)%(array.count)]
                        }, label: {
                            Image(systemName: "forward.end.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        })
                        Spacer()
                        Image(systemName: "repeat")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}

#Preview {
    SongView(song: Song(id: 0, name: "Blank Space", artist: "Taylor Swift", cover: "https://upload.wikimedia.org/wikipedia/pt/1/10/Capa_de_Blank_Space.png"), array: [
            Song(id: 0, name: "Blank Space", artist: "Taylor Swift", cover: "https://upload.wikimedia.org/wikipedia/pt/1/10/Capa_de_Blank_Space.png"),
            Song(id: 1, name: "Style", artist: "Taylor Swift", cover: "https://upload.wikimedia.org/wikipedia/pt/thumb/4/41/Taylor_Swift_-_Style.png/220px-Taylor_Swift_-_Style.png")
        ]
    )
}
