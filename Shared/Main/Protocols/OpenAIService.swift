//
//  OpenAIService.swift
//  ChatGptiOS
//
//  Created by Vitor Henrique Barreiro Marinho on 13/04/25.
//

import Foundation

protocol OpenAIService {
    func search(with chatText: String, completion: @escaping (String?) -> Void)
}
