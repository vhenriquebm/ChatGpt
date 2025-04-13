//
//  ChatMessageResponse.swift
//  ChatGptiOS
//
//  Created by Vitor Henrique Barreiro Marinho on 13/04/25.
//

import Foundation
import OpenAISwift

public struct ChatMessageResponse: Codable, Identifiable {
    public var id = UUID()
    public let role: ChatRole?
    public let content: String?
    
    enum CodingKeys: String, CodingKey {
        case role, content
    }
    
    public init(role: ChatRole, content: String) {
        self.role = role
        self.content = content
    }
}

public struct ChoiceResponse: Codable {
    public let index: Int?
    public let message: ChatMessageResponse?
    public let finish_reason: String?
}

public struct CustomChatResponse: Codable {
    public let id: String?
    public let object: String?
    public let created: Int?
    public let model: String?
    public let choices: [ChoiceResponse]?
}
