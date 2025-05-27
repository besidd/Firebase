//
//  ForgotPasswordView.swift
//  FirebaseAppiOS
//
//  Created by Siddharth Bhayana on 27/05/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var viewmodel: AuthViewModel
    @EnvironmentObject var router: Router
    @State private var email: String = ""
    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Reset Password")
                    .font(.largeTitle)
                
                Text("Enter the email address associate with your account to reset your password.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 32)
                
                InputView(placeHolder: "Enter you email", text: $email)
                    .padding(.bottom, 16)
            }
            
            Button {
                Task {
                    await viewmodel.resetPassword(by: email)
                    if !viewmodel.isError {
                        router.navigate(to: .recoveryEmailSent)
                    }
                }
            } label: {
                Text("Continue")
            }
            .buttonStyle(CapsuleButtonStyle())
            
            Spacer()
        }
        .padding()
        .toolbarRole(.editor)
    }
}

#Preview {
    ForgotPasswordView()
        .environmentObject(AuthViewModel())
}
