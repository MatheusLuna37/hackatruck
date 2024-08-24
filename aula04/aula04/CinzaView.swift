//
//  CinzaView.swift
//  aula04
//
//  Created by Turma02-20 on 23/08/24.
//

import SwiftUI

struct CinzaView: View {
    @State private var cor: Color = .gray
    var body: some View {
        ZStack {
            Color(cor)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    ZStack {
                        Circle()
                            .frame(width: 300, height: 300)
                        Image(systemName: "paintpalette")
                            .foregroundColor(cor)
                            .font(.system(size: 200))
                    }
                    VStack {
                        Spacer()
                        Color(.white)
                            .ignoresSafeArea()
                            .frame(height: 30)
                    }
                }
            }
        }
    }
}

#Preview {
    CinzaView()
}
