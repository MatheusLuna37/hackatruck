//
//  ViewModel.swift
//  Aula07
//
//  Created by Turma02-20 on 30/08/24.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var comms: [Comment] = []
    
    func fetch() {
        
        let task = URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/comments")!) {data, _, error in
            do {
                self.comms = try JSONDecoder().decode([Comment].self, from: data!)
            }
            catch {
                print(error)
            }

        }
        task.resume()

    }
}
