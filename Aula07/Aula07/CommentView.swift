//
//  CommentView.swift
//  Aula07
//
//  Created by Turma02-20 on 30/08/24.
//

import SwiftUI

struct CommentView: View {
    var comm: Comment
    var body: some View {
        if (comm.body != nil) {
            Text(comm.body!)
                .padding()
        }
    }
}

