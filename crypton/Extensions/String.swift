//
//  String.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

extension String {
    func getInitials() -> String {
        let words = self.split(separator: " ")
        let initials = words.prefix(2).compactMap { $0.first }
        return String(initials)
    }
}

