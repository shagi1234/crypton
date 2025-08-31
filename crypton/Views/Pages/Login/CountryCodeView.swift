//
//  CountryCodeView.swift
//  crypton
//
//  Created by Meylis on 24.01.2025.
//

import SwiftUI

struct CountryCodeView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    
    var onSelectCountry: (Country) -> Void
    
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { country in
                country.name.lowercased().contains(searchText.lowercased()) ||
                country.code.contains(searchText)
            }
        }
    }
    
    var groupedCountries: [String: [Country]] {
        Dictionary(grouping: filteredCountries) { country in
            String(country.name.prefix(1)).uppercased()
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack {
                // Centered Text
                Text("Language")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
                    .padding(.vertical, 10)

                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                            .font(.system(size: 12)) // Icon size
                            .frame(width: 30, height: 30) // Button size (2 * radius)
                            .background(Color(red: 234/255, green: 236/255, blue: 239/255)) // Circle background color #EAECEF
                            .clipShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(10)
                    
                    TextField("Search", text: $searchText)
                        
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
//                .padding(.top, 10)
            }
            .padding(.horizontal, 16)
            
            
            List {
                ForEach(groupedCountries.keys.sorted(), id: \.self) { letter in
                    Section(
                        header:
                            
                            Text(letter)
                                .font(.system(size: 14, weight: .none, design: .default))
                                .multilineTextAlignment(.leading) // Align text to the left
                                .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Text color
//                            .padding(.horizontal, 16)
                        
                    ) {
                        ForEach(groupedCountries[letter]!) { country in
                            Button(action: {
                                onSelectCountry(country)
                                dismiss()
                            }) {
                                HStack {
                                    Image("49")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Color.white, lineWidth: 3)
                                        )
                                        .frame(width: 18, height: 18)
                                    
                                    Text(country.name)
                                        .font(.system(size: 14, weight: .regular)) // if active .semibold
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255))
                                    
                                    Spacer()
                                    
                                    Text(country.code)
                                        .font(.system(size: 14, weight: .regular)) // if active .semibold
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255))
                                }
                                .padding(.vertical, 8)
                            }
                            .listRowInsets(EdgeInsets())
                            .background(Color.clear)
                        }
                    }
                    .listSectionSpacing(.zero)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color(Color.clear))
                    .listRowInsets(EdgeInsets())
                    .listSectionSeparator(.hidden)
                }
            }
            .padding(.horizontal, 16)
            .listStyle(.plain)
        }
        
    }
}

struct CountryCodeView_Previews: PreviewProvider {
    static var previews: some View {
        
        CountryCodeView(onSelectCountry: {_ in 
            
        })
    
    }
}
