//
//  ViewModel.swift
//  Aula07
//
//  Created by Turma02-20 on 30/08/24.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var estacionamento: [Estacionamento] = []
    
    func fetch() {
        
        let task = URLSession.shared.dataTask(with: URL(string: "http://127.0.0.1:1880/estacionamentos")!) {data, _, error in
            do {
                self.estacionamento = try JSONDecoder().decode([Estacionamento].self, from: data!)
                print(self.estacionamento)
            }
            catch {
                print(error)
            }

        }
        task.resume()

    }
}
