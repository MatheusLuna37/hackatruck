//
//  ContentView.swift
//  aula06
//
//  Created by Turma02-20 on 29/08/24.
//

import SwiftUI
import Foundation
import MapKit

struct Location : Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let description: String
}

var locations = [
    Location(name: "Brazil", coordinate: CLLocationCoordinate2D(latitude: -15.782286, longitude: -47.887249), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/250px-Flag_of_Brazil.svg.png", description: "Brasil (localmente [bɾaˈziw][b]), oficialmente República Federativa do Brasil (escutarⓘ),[7] é o maior país da América do Sul e da região da América Latina, sendo o quinto maior do mundo em área territorial (equivalente a 47,3% do território sul-americano), com 8 510 417,771 km²,[1][8][9] e o sétimo em população[10][11] (com 203 milhões de habitantes, em agosto de 2022).[12] É o único país na América onde se fala majoritariamente a língua portuguesa e o maior país lusófono do planeta,[13] além de ser uma das nações mais multiculturais e etnicamente diversas, em decorrência da forte imigração oriunda de variados locais do mundo. Sua atual Constituição, promulgada em 1988, concebe o Brasil como uma república federativa presidencialista,[7] formada pela união dos 26 estados, do Distrito Federal e dos 5 571 municípios.[7][14][nota 1]"),
    Location(name: "United States", coordinate: CLLocationCoordinate2D(latitude: 38.9041, longitude: -77.0171), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/250px-Flag_of_the_United_States.svg.png", description: "Os Estados Unidos da América (EUA; em inglês: United States of America — USA; pronunciado: [juːˈnaɪ.təd ˈsteɪʦ əv əˈmɛ.ɹɪ.kə]), ou simplesmente Estados Unidos ou América,[11] são uma república constitucional federal composta por 50 estados e um distrito federal. A maior parte do país situa-se na região central da América do Norte, formada por 48 estados e o Distrito de Colúmbia, o distrito federal da capital. Banhado pelos oceanos Pacífico e Atlântico, faz fronteira com o Canadá ao norte e com o México ao sul. O estado do Alasca está no noroeste do continente, fazendo fronteira com o Canadá no leste e com a Rússia a oeste, através do estreito de Bering. O estado do Havaí é um arquipélago no Pacífico Central. O país também possui vários outros territórios no Caribe e no Oceano Pacífico. Com 9,37 milhões de km² de área e uma população de mais de 330 milhões de habitantes, o país é o quarto maior em área total, o quinto maior em área contígua e o terceiro em população. Os Estados Unidos são uma das nações mais multiculturais e etnicamente diversas do mundo, produto da forte imigração vinda de muitos países.[12] Sua geografia e sistemas climáticos também são extremamente diversificados, com desertos, planícies, florestas e montanhas que abrigam uma grande variedade de espécies."),
    Location(name: "Austrália", coordinate: CLLocationCoordinate2D(latitude: -35.3081, longitude: 149.124), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/250px-Flag_of_Australia_%28converted%29.svg.png", description: "Austrália (em inglês: Australia, pronunciado: [ɒˈstreɪliə, ə-], coloquialmente: [-jə]), oficialmente Comunidade da Austrália (em inglês: Commonwealth of Australia), é um país do hemisfério sul, localizado na Oceania, que compreende a menor área continental do mundo[7][8] (continente australiano'), a ilha da Tasmânia e várias ilhas adjacentes nos oceanos Índico e Pacífico. O continente-ilha, como a Austrália por vezes é chamada, é banhado pelo oceano Índico, ao sul, e a oeste pelo mar de Timor, mar de Arafura e Estreito de Torres, a norte, e pelo mar de Coral e mar da Tasmânia, a leste. Através destes mares, tem fronteira marítima com a Indonésia, Timor-Leste e Papua-Nova Guiné, a norte, e com o território francês da Nova Caledónia, a leste, e a Nova Zelândia a sudeste.")
]

struct ContentView: View {
    @State private var location = locations[0]
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -15.782286, longitude: -47.887249), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    ))
    @State private var showingSheet: Bool = false
    var body: some View {
        ZStack {
            Map(position: $position) {
                Annotation("", coordinate: location.coordinate) {
                    Image(systemName: "signpost.right.fill")
                        .foregroundColor(.black)
                        .background(.white)
                        .font(.title)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            showingSheet.toggle()
                        }
                        .sheet(isPresented: $showingSheet) {
                            VStack {
                                Text(location.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding()
                                AsyncImage(url: URL(string: location.flag)) { image in
                                    image.resizable().frame(width: 360, height: 240)
                                } placeholder: {
                                }
                                Text(location.description)
                                    .padding()
                            }
                        }
                }
            }
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Color(.white)
                        .opacity(0.6)
                        .ignoresSafeArea()
                    VStack {
                        Text("World Map")
                            .font(.title)
                            .fontWeight(.bold)
                        Text(location.name)
                    }
                }
                .frame(height: 100)
                Spacer()
                HStack {
                    Button(action: {
                        location = locations[0]
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        ))
                    }, label: {
                        AsyncImage(url: URL(string: locations[0].flag)) { image in
                            image.resizable().frame(width: 120, height: 80)
                        } placeholder: {
                        }
                    })
                    Button(action: {
                        location = locations[1]
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        ))
                    }, label: {
                        AsyncImage(url: URL(string: locations[1].flag)) { image in
                            image.resizable().frame(width: 120, height: 80)
                        } placeholder: {
                        }
                    })
                    Button(action: {
                        location = locations[2]
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        ))
                    }, label: {
                        AsyncImage(url: URL(string: locations[2].flag)) { image in
                            image.resizable().frame(width: 120, height: 80)
                        } placeholder: {
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
