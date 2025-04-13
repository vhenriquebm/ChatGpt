//
//  Secrets.swift
//  ChatGpt
//
//  Created by Vitor Henrique Barreiro Marinho on 13/04/25.
//

import Foundation

enum Secrets {
    static var openAIKey: String {
        guard let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let plist = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any],
              let key = plist["OPENAI_API_KEY"] as? String else {
            fatalError("API Key not found in Secrets.plist")
        }
        return key
    }
}
