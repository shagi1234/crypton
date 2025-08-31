//
//  CallListView.swift
//  crypton
//
//  Created by Meylis on 11.02.2025.
//

import SwiftUI

import Kingfisher

struct CallListView: View {
    
    @State private var searchText = ""
    @State private var sortByName = false
    @State private var selectedGender: String = "All"
    
    @State private var list: [RoomModel] = RoomModel.list
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - header
            HStack(alignment: .center, spacing: 0) {
                HStack(spacing: 0) {
                    
                    Menu {
                        Button(action: {
                            sortByName = true
                        }) {
                            Label("By name", systemImage: sortByName ? "checkmark" : "")
                        }
                        Button(action: {
                            sortByName = false
                        }) {
                            Label("By time", systemImage: !sortByName ? "checkmark" : "")
                        }
                    } label: {
                        Text("Sort")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                    }
                }
                
                Spacer()
                
                Text("Calls")
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
            
            Picker("Пол", selection: $selectedGender) {
                Text("All").tag("All")
                Text("Missed").tag("Missed")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            Rectangle()
                .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255))
                .frame(height: 1)
                .edgesIgnoringSafeArea(.horizontal)
            List {
                ForEach(0..<list.count) { i in
                    CallListViewItem(room: list[i], isOnline: i % 5 == 1 || selectedGender == "Missed")
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

struct CallListView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: .calls)
    }
}


