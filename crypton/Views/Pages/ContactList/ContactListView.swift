//
//  ContactListView.swift
//  crypton
//
//  Created by Meylis on 10.02.2025.
//

import SwiftUI

import Kingfisher

struct ContactListView: View {
    
    @State private var searchText = ""
    
    @State private var list: [RoomModel] = RoomModel.list
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - header
            HStack(alignment: .center, spacing: 0) {
                HStack(spacing: 0) {
                    Button(action: {
                        
                    }, label: {
                        Text("Edit")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                    })
                }
                
                Spacer()
                
                Text("Contacts")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
                
                Spacer()
                
                HStack(spacing: 0) {
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .renderingMode(.template)
                            .padding(4)
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255)) // Icon color #A1ABBE
                    })
                }
                .frame(width: 24)
            }
            .padding(.horizontal, 16)
            .frame(height: 44)
            // MARK: - header done
            
            VStack(alignment: .leading, spacing: 15) {
                SearchView(searchText: .constant(""))
                    .previewLayout(.sizeThatFits)
                    .padding(.top, 12)
                
                Text("83 Contacts")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255))
            }
            .padding(.horizontal, 16)
            
            List {
                
                ForEach(list) { room in

                    Section(
                        header:
                            Text("A")
                                .font(.system(size: 14, weight: .none, design: .default))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                                .padding(.top, -8)
                    ) {
                        
                        ForEach(1..<3) { i in
                            ContactListViewItem(room: room, isOnline: i == 1, topLine: i == 1)
                                .background(
                                    NavigationLink(destination: ContactProfileView()) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                )
                                .contentShape(Rectangle())
                                .listSectionSpacing(.zero)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color(Color.clear))
                                .listRowInsets(EdgeInsets())
                                .listSectionSeparator(.hidden)
                        }
                    }
                }
            }
            .navigationDestination(for: RoomModel.self) { room in
                ContactProfileView()
            }
            .listStyle(.inset)
        }
        .searchable(text: $searchText, prompt: "Search ...")
        .navigationBarTitleDisplayMode(.inline)
//        .accentColor(Color(red: 161/255, green: 171/255, blue: 190/255))
    }
    
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: .contacts)
    }
}


