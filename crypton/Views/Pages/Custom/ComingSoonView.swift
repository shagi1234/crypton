//
//  ComingSoonView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

struct ComingSoonView: View {
    
    let text: String
    
    var body: some View {
        VStack {
            Text("Coming Soon")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle(text)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ComingSoonView(text: "Coming soon")
        }
    }
}

