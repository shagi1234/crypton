//
//  SearchView.swift
//  crypton
//
//  Created by Meylis on 05.02.2025.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var placeholder: String = "Search..."
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField(placeholder, text: $searchText)
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
        .padding(8)
        .background(Color(.systemGray6)) // Light gray background
        .cornerRadius(8)
    }
}

// MARK: - Preview
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}

