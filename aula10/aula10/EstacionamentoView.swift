//
//  EstacionamentoView.swift
//  aula10
//
//  Created by Turma02-20 on 03/09/24.
//

import SwiftUI

struct EstacionamentoView: View {
    var estacionamento: Estacionamento
    var body: some View {
        ScrollView {
            VStack {
                ForEach(estacionamento.carros, id: \.self) { item in
                    VStack {
                        Text(item.modelo)
                        Text(String(describing: item.ano))
                        Text(item.cor)
                        Text(String(describing: item.preco))
                        AsyncImage(url: URL(string: item.foto)) {image in
                            image.resizable().frame(width: 300, height: 200)
                        } placeholder: {
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    EstacionamentoView(estacionamento: Estacionamento(_id: "1", nomeEstacionamento: "Teste", quantidadeVagas: 2, carros: [Carro(modelo: "Teste", ano: 2000, cor: "Preto", preco: 20.00, foto: "https://media-repository-mobiauto.storage.googleapis.com/production/images/editorial/magazine/1686783328407.uno7.jpg")]))
}
