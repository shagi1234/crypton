//
//  TestView.swift
//  crypton
//
//  Created by Meylis on 05.02.2025.
//

import SwiftUI

struct CollapsibleHeaderListView: View {
    @State private var searchText = ""
    @State private var isHeaderVisible = true
    @State private var scrollOffset: CGFloat = 0
    @State private var lastOffset: CGFloat = 0
    
    let items = (1...50).map { "Item \($0)" } // Sample data
    
    var body: some View {
        VStack(spacing: 0) {
            // Collapsible Header
            if isHeaderVisible {
                HeaderView(searchText: $searchText)
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
            
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { proxy -> Color in
                        let offsetY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut) {
                                if offsetY < lastOffset {
                                    isHeaderVisible = false // Hide header on scroll down
                                } else if offsetY > lastOffset {
                                    isHeaderVisible = true  // Show header on scroll up
                                }
                                lastOffset = offsetY
                            }
                        }
                        return Color.clear
                    }
                    .frame(height: 0) // Invisible offset tracking
                    
                    // List Content
                    ForEach(items.filter { searchText.isEmpty ? true : $0.lowercased().contains(searchText.lowercased()) }, id: \.self) { item in
                        Text(item)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                            .padding(.horizontal)
                    }
                }
                .padding(.top, isHeaderVisible ? 0 : 44) // Prevents jump when hiding header
            }
        }
        .animation(.easeInOut, value: isHeaderVisible)
    }
}

// MARK: - Collapsible Header View
struct HeaderView: View {
    @Binding var searchText: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)

                TextField("Search...", text: $searchText)
                    .foregroundColor(.primary)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            
            Divider()
        }
        .background(Color.white.shadow(radius: 2))
        .padding(.bottom, 4)
    }
}

// MARK: - Preview
struct CollapsibleHeaderListView_Previews: PreviewProvider {
    static var previews: some View {
        CollapsibleHeaderListView()
    }
}
