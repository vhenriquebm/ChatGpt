//
//  MainService.swift
//  ChatGptiOS
//
//  Created by Vitor Henrique Barreiro Marinho on 13/04/25.
//

import Foundation
import OpenAISwift

class MainService: OpenAIService {
    
    func search(with chatText: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            completion(APIError.invalidUrl.localizedDescription)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(Secrets.openAIKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let payload: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                ["role": "user", "content": chatText]
            ],
            "max_tokens": 500
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: payload, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(APIError.requestError.localizedDescription, error)
                completion(error.localizedDescription)
                return
            }
            guard let data = data else {
                completion(APIError.noData.localizedDescription)
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(CustomChatResponse.self, from: data)
                if let reply = decoded.choices?.first?.message?.content?.trimmingCharacters(in: .whitespacesAndNewlines) {
                    completion(reply)
                } else {
                    print(APIError.noMessageFound.localizedDescription)
                    completion(nil)
                }
            } catch {
                print(APIError.decodingError, error)
                completion(error.localizedDescription)
            }
        }.resume()
    }
}
