//
//  String+Extensions.swift
//  ChatGptiOS
//
//  Created by Vitor Henrique Barreiro Marinho on 13/04/25.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
