//
//  ChatListView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI
import Kingfisher

struct ChatListView: View {
    
    @State private var isVStackVisible = false
    
    @State private var searchText = ""
    @State private var list: [RoomModel] = RoomModel.list
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - header
            HStack(alignment: .center, spacing: 0) {
                HStack(spacing: 0) {
                    NavigationLink(destination: ComingSoonView(text: "Add Contact")) {
                        Image("toolbar-chatlist-more")
                            .resizable()
                            .renderingMode(.template)
                            .padding(4)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                    }
                    Spacer()
                }
                .frame(width: 64)
                
                Spacer()
                
                Text("Chats")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
                
                Spacer()
                
                HStack(spacing: 0) {
                    
                    Button(action: {
                        withAnimation {
                            isVStackVisible.toggle()
                        }
                    }, label: {
                        Image("toolbar-chatlist-add-story")
                            .resizable()
                            .renderingMode(.template)
                            .padding(4)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                    })
                    
//                    NavigationLink(destination: ComingSoonView(text: "Add Contact")) {
//                        
//                    }
                    NavigationLink(destination: ComingSoonView(text: "Add Contact")) {
                        Image("toolbar-add-chat")
                            .resizable()
                            .renderingMode(.template)
                            .padding(4)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                    }
                }
                .frame(width: 64)
                
            }
            .padding(.horizontal, 16)
            .frame(height: 44)
            // MARK: - header done
            
            VStack(alignment: .leading, spacing: 0) {
                SearchView(searchText: .constant(""))
                    .previewLayout(.sizeThatFits)
                    .padding(.top, 12)
                    .padding(.horizontal, 16)
                
                
                // MARK: -stories
                if isVStackVisible {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Stories")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            .padding(.horizontal, 16)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 7) {
                                ForEach(list.indices, id: \.self) { index in
                                    StoriesCell()
                                        .frame(width: 100, height: 140)
                                        .cornerRadius(8)
                                        .padding(.leading, index == 0 ? 16 : 0)
                                        .padding(.trailing, list.count - index == 1 ? 16 : 0)
                                }
                            }
                        }
                        .background(.white)
                    }
                    .animation(.easeInOut, value: isVStackVisible)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Recent Chats")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 7) {
                            Button(action: {
                                print("All chats tapped")
                            }) {
                                Image("filters")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // #A1ABBE
                                
                                    
                            }
                            .frame(width: 26, height: 26)
                            .background(Color(red: 70/255, green: 96/255, blue: 135/255, opacity: 10/255))
                            .cornerRadius(4)
                            .padding(.leading, 16)
                            
                            Button(action: {
                                print("All chats tapped")
                            }) {
                                Text("All chats")
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .frame(height: 26)
                                
                                    .padding(.horizontal, 8)
                                    .background(Color(red: 1.0, green: 59/255, blue: 48/255))
                                    .foregroundColor(.white)
                                    .cornerRadius(4)
                            }
                            
                            Button(action: {
                                print("Pinned")
                            }) {
                                Text("Pinned")
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .frame(height: 26)
                                
                                    .padding(.horizontal, 8)
                                    .background(Color(red: 70/255, green: 96/255, blue: 135/255, opacity: 10/255))
                                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                                    .cornerRadius(4)
                            }
                            
                            Button(action: {
                                print("Personal")
                            }) {
                                Text("Personal")
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .frame(height: 26)
                                
                                    .padding(.horizontal, 8)
                                    .background(Color(red: 70/255, green: 96/255, blue: 135/255, opacity: 10/255))
                                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                                    .cornerRadius(4)
                            }
                            
                            Button(action: {
                                print("Group")
                            }) {
                                Text("Group")
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .frame(height: 26)
                                
                                    .padding(.horizontal, 8)
                                    .background(Color(red: 70/255, green: 96/255, blue: 135/255, opacity: 10/255))
                                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                                    .cornerRadius(4)
                            }
                            
                            Button(action: {
                                print("AI Chat")
                            }) {
                                Text("AI Chat")
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .frame(height: 26)
                                
                                    .padding(.horizontal, 8)
                                    .background(Color(red: 70/255, green: 96/255, blue: 135/255, opacity: 10/255))
                                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                                    .cornerRadius(4)
                            }
                        }
                    }
    //                .padding(.horizontal, 16)
                    .background(.white)
                }
                
                Spacer(minLength: 15)
                Rectangle()
                    .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255)) // #EAECEF color
                    .frame(height: 1) // Adjust height for the line thickness
                    .edgesIgnoringSafeArea(.horizontal) // Make it span the width of the screen (optional)

                
                List {
                    
                    ForEach(list) { room in

                        ChatListItemRowView(room: room)
                            .background(
                                NavigationLink(destination: ChatRoomView(room: room)) {
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
                        
                            .swipeActions(edge: .leading) {
                            
                                Button {
                                    print("Marked as unread")
                                } label: {
                                    swipeIcon(label: "Pin", image: "pin")
                                }
                                .tint(Color(red: 30 / 255, green: 180 / 255, blue: 228 / 255)) // #1EB4E4
                                
                                Button {
                                    print("Mute")
                                } label: {
                                    swipeIcon(label: "Mute", image: "bell-mute")
                                }
                                .tint(Color(red: 179 / 255, green: 185 / 255, blue: 195 / 255)) // #B3B9C3
                            }

                            .swipeActions(edge: .trailing) {
                                
                                Button {
                                    print("To Archive")
                                } label: {
                                    swipeIcon(label: "To Archive", image: "archive")
                                }
                                .tint(Color(red: 228 / 255, green: 161 / 255, blue: 30 / 255)) // #E4A11E
                                
                                Button {
                                    print("Delete")
                                } label: {
                                    swipeIcon(label: "Delete", image: "delete")
                                }
                                .tint(Color(red: 228 / 255, green: 30 / 255, blue: 39 / 255)) // #E41E27
                                
                                Button {
                                    print("More")
                                } label: {
                                    swipeIcon(label: "More", image: "more-hor")
                                }
                                .tint(Color(red: 179 / 255, green: 185 / 255, blue: 195 / 255)) // #B3B9C3
                                
                            }
                            .contextMenu {
                                Button(action: {
                                    // Action for reply
            //                        print("Replying to: \(message)")
                                }) {
                                    Label("Reply", systemImage: "arrowshape.turn.up.left")
                                }
                                
                                Button(action: {
                                    // Action for forwarding
            //                        print("Forwarding: \(message)")
                                }) {
                                    Label("Forward", systemImage: "arrowshape.turn.up.right")
                                }
                                
                                Button(role: .destructive, action: {
                                    // Action for delete
            //                        print("Deleting: \(message)")
                                }) {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                .navigationDestination(for: RoomModel.self) { room in
                    ChatRoomView(room: room)
                }
            }
        }
        .listStyle(.inset)
        .searchable(text: $searchText, prompt: "Search ...")
        .navigationBarTitleDisplayMode(.inline)
        .accentColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
//        .toolbar(.hidden, for: .tabBar)
    }
    
    
    
    private func swipeIcon(label: String, image: String) -> some View {
        let w: CGFloat = 90
        let h = w
        let size = CGSize(width: w, height: h)
        let text = Text(LocalizedStringKey(label))
        let symbol = Image(image)
        return Image(size: size, label: text) { ctx in
            let resolvedText = ctx.resolve(text)
            let textSize = resolvedText.measure(in: CGSize(width: w, height: h * 0.6))
            let resolvedSymbol = ctx.resolve(symbol)
            let symbolSize = resolvedSymbol.size
            let heightForSymbol: CGFloat = min(h * 0.35, (h * 0.9) - textSize.height)
            let widthForSymbol = (heightForSymbol / symbolSize.height) * symbolSize.width
            let xSymbol = (w - widthForSymbol) / 2
            let ySymbol = max(h * 0.05, heightForSymbol - (textSize.height * 0.6))
            let yText = ySymbol + heightForSymbol + max(0, ((h * 0.8) - heightForSymbol - textSize.height) / 2)
            let xText = (w - textSize.width) / 2
            ctx.draw(
                resolvedSymbol,
                in: CGRect(x: xSymbol, y: ySymbol, width: widthForSymbol, height: heightForSymbol)
            )
            ctx.draw(
                resolvedText,
                in: CGRect(x: xText, y: yText, width: textSize.width, height: textSize.height)
            )
        }
        .foregroundStyle(.white)
        .font(.body)
        .lineLimit(2)
        .lineSpacing(-2)
        .minimumScaleFactor(0.7)
        .multilineTextAlignment(.center)
    }
    
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: .chats)
    }
}

