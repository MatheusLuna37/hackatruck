//
//  Model.swift
//  Aula07
//
//  Created by Turma02-20 on 30/08/24.
//

import Foundation

struct Comment: Codable, Identifiable {
    let postId : Int?
    let id : Int?
    let name : String?
    let email : String?
    let body : String?
}
