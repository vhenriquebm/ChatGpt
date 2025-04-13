//
//  MainViewModel.swift
//  ChatGptiOS
//
//  Created by Vitor Henrique Barreiro Marinho on 13/04/25.
//

import Foundation

class MainViewModel: ObservableObject {
    var service: OpenAIService
    
    init() {
        service = MainService()
    }
    
    func search(with chatText: String, completion: @escaping (String?) -> Void) {
        service.search(with: chatText, completion: completion)
    }
}
