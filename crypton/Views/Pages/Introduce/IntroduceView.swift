//
//  IntroduceView.swift
//  crypton
//
//  Created by Meylis on 23.01.2025.
//

import SwiftUI

struct IntroduceView: View {
    @State private var currentPage = 0
    private let totalPages = 3
    @State private var shouldNavigate = false
    
    @State private var showNextView = false
    
    init() {
        let pageControl = UIPageControl.appearance()
        pageControl.currentPageIndicatorTintColor = UIColor(red: 1.0, green: 0.23, blue: 0.19, alpha: 1.0) // Active: #FF3B30
        pageControl.pageIndicatorTintColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1) // Inactive: Light gray
        pageControl.backgroundStyle = .minimal // Ensures a consistent background style
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        IntroduceItemView()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .padding(.bottom, 40)
                
                Spacer()
                
            }
            .padding()
            
            VStack {
                
                CustomButton(title: "Start Messaging", backgroundColor: UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)) {
                    showNextView = true
                }
                .padding()
                .navigationDestination(isPresented: $showNextView) {
                    LoginView()
                }
            }
        }
    }
}

struct CustomButton: View {
    let title: String
    let backgroundColor: UIColor
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack { // Ensure the frame applies to the entire button
                if title.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(width: 24, height: 24)
                } else {
                    Text(title)
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 50)
        }
        .background(Color(backgroundColor))
        .cornerRadius(12)
        .disabled(title.isEmpty)
    }
}



struct IntroduceView_Previews: PreviewProvider {
    static var previews: some View {
        IntroduceView()
    }
}
