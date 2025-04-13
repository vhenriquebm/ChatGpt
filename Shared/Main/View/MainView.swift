//
//  MainView.swift
//  ChatGptiOS
//
//  Created by Vitor Henrique Barreiro Marinho on 13/04/25.
//

import SwiftUI
import OpenAISwift

struct MainView: View {
    @State private var chatText: String = ""
    @ObservedObject var viewModel = MainViewModel()
    @State private var answers: [String] = []
    
    var body: some View {
        VStack {
            
            List(answers, id: \.self) { answer in
                Text(answer)
            }
            
            Spacer()
            
            HStack {
                TextField("Search...", text: $chatText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button {
                    search()
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.title)
                        .rotationEffect(Angle(degrees: 45))
                }
                .buttonStyle(.borderless)
                .tint(.blue)
                .disabled(!isFormValid)
            }
        }
    }
    
    private var isFormValid: Bool {
        !chatText.isEmptyOrWhiteSpace
    }
    
    private func search() {
        print("🔍 Botão pressionado")
        viewModel.search(with: chatText, completion: { answer in
            
            if let answer = answer {
                answers.append(answer)
            }
        })
    }
}

#Preview {
    MainView()
}
