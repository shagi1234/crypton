//
//  IntroduceItemView.swift
//  crypton
//
//  Created by Meylis on 23.01.2025.
//

import SwiftUI

struct IntroduceItemView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "message")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 250)
                .padding(.top, 50)

            Text("Ut enim ad minim")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(8)

            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}


struct IntroduceItemView_Previews: PreviewProvider {
    static var previews: some View {
        IntroduceItemView()
    }
}
