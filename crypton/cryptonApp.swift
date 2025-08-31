//
//  cryptonApp.swift
//  crypton
//
//  Created by Meylis on 23.01.2025.
//

import SwiftUI

@main
struct cryptonApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
//            SplashView()
//            ContentView()
            TabbarView()
//                .onAppear {
//                    
////                    Image("back")
////                        .resizable()
////                        .aspectRatio(contentMode: .fit)
////                        .frame(width: 24, height: 24)
//                    
//                    UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "arrow.backward")
//                    UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
//                }
        }
    }
}
