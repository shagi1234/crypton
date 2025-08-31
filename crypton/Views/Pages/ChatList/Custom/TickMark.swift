//
//  TickMark.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

struct TickMark: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + 0.1 * rect.width, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX + 0.44 * rect.width, y: rect.maxY - 2))
        path.addLine(to: CGPoint(x: (rect.maxX - 0.1 * rect.width) + 2, y: rect.minY + 1))
        
        return path
    }
}

struct TickMarkRead: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + 0.1 * rect.width, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX + 0.44 * rect.width, y: rect.maxY - 2))
        path.addLine(to: CGPoint(x: (rect.maxX - 0.1 * rect.width) + 2, y: rect.minY + 1))
        
        path.move(to: CGPoint(x: (rect.minX + 0.44 * rect.width) + 3, y: rect.maxY - 2))
        path.addLine(to: CGPoint(x: ((rect.maxX - 0.1 * rect.width) + 2) + 3, y: rect.minY + 1))
        
        return path
    }
}

struct TickMark_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: .chats)
//        UnreadBadgeView(count: 500, backgroundColor: .gray)
//        UnreadBadgeView(count: 500)
    }
}
