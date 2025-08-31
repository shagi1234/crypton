//
//  Snackbar.swift
//  crypton
//
//  Created by Meylis on 04.02.2025.
//

import SwiftUI

enum SnackbarStatus {
    case success
    case error
    case `default`
}

struct Snackbar: View {
    let message: String
    let status: SnackbarStatus
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(message)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            .background(backgroundColor)
            .cornerRadius(8)
            .padding()
            .transition(.slide)
            .onTapGesture {
                isPresented = false
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isPresented)
    }
    
    private var backgroundColor: Color {
        switch status {
        case .success:
            return Color.green
        case .error:
            return Color.red
        case .default:
            return Color.black.opacity(0.8)
        }
    }
}

struct Snackbar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Snackbar(message: "Profile updated successfully!", status: .success, isPresented: .constant(true))
            Snackbar(message: "Failed to update profile.", status: .error, isPresented: .constant(true))
            Snackbar(message: "Failed to update profile.", status: .default, isPresented: .constant(true))
        }
    }
}

