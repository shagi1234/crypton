//
//  ContentView.swift
//  crypton
//
//  Created by Meylis on 23.01.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            VStack {
                tabsView
            }
        }
    }
    
    var tabsView: some View {
        TabView {
            NavigationView { // ✅ Move NavigationView inside TabView
                            TabView1()
                        }
                .tabItem({
                    Image(systemName: "flame")
                    Text("Fire")
                }).tag(1)
            
            TabView2()
                .tabItem({
                    Image(systemName: "umbrella")
                    Text("Rain")
                }).tag(2)
        }
    }
}

// MARK:- Tab View 1
struct TabView1: View {
    @EnvironmentObject var appState: AppState
    @State var isView1Active: Bool = false
    
    var body: some View {
        VStack {
            Text("Tab View 1")
                .font(.headline)
            NavigationLink(destination: View1(), isActive: $isView1Active) {
                Text("View 1")
                    .font(.headline)
            }
            .isDetailLink(false)
        }
        .navigationTitle("Test")
    }
}

// MARK:- Tab View 2
struct TabView2: View {
    
    var body: some View {
        VStack {
            Text("Tab View 2")
                .font(.headline)
        }
    }
}

// MARK:- View 1
struct View1: View {
    var body: some View {
        VStack {
            Text("View 1")
                .font(.headline)
            NavigationLink(destination: View2()) {
                Text("View 2")
                    .font(.headline)
            }
        }
    }
}

// MARK:- View 2
struct View2: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            Text("View 2")
                .font(.headline)
            Button(action: {
                // FIXME:- add move to dashboard functionality
                
            }) {
                Text("Move to Dashboard")
                .font(.headline)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
