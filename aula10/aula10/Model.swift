//
//  Model.swift
//  aula10
//
//  Created by Turma02-20 on 03/09/24.
//

import Foundation

struct Carro: Decodable, Hashable{
    let modelo: String
    let ano: Int
    let cor: String
    let preco: Double
    let foto: String
}

struct Estacionamento: Decodable, Hashable{
    let _id: String
    let nomeEstacionamento: String
    let quantidadeVagas: Int
    let carros: [Carro]
}
