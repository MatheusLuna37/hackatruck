//
//  ViewModel.swift
//  Aula07
//
//  Created by Turma02-20 on 30/08/24.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var est: [Estacionamento] = []
    
    func fetch() {
        
        let task = URLSession.shared.dataTask(with: URL(string: "127.0.0.1:1880/nome")!) {data, _, error in
            do {
                self.est = try JSONDecoder().decode([Estacionamento].self, from: data!)
            }
            catch {
                print(error)
            }

        }
        task.resume()

    }
}
