//
//  SingInView.swift
//  Firebase
//
//  Created by Siddharth Bhayana on 26/05/25.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var router: Router
    
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
                
            
            Text("Please complete all the information to create an account")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer().frame(height: 32)
            
            InputView(placeHolder: "Email or phone number", text: $email)
            InputView(placeHolder: "Your Name", text: $name)
            InputView(placeHolder: "Password", text: $password, isSecureFeild: true)
            
            ZStack(alignment: .trailing) {
                InputView(placeHolder: "Confirm Password", text: $confirmPassword, isSecureFeild: true)
                Spacer()
                if !password.isEmpty && !confirmPassword.isEmpty {
                    Image(systemName: "\(isValidPassword ? "checkmark" : "xmark").circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(isValidPassword ? Color(.systemGreen): Color(.systemRed))
                }
            }
            
            Spacer()
            
            Button{
                Task {
                    await viewModel
                        .createUser(email: email, name: name, password: password)
                    
                    if !viewModel.isError {
                        router.navigateBack()
                    }
                }
            } label: {
                Text("Sign Up!")
            }
            .buttonStyle(CapsuleButtonStyle())
            
        }
        .navigationTitle("Setup Your Account")
        .toolbarRole(.editor)
        .padding()
    }
    
    var isValidPassword: Bool {
       return confirmPassword == password
    }
}

#Preview {
    SignInView()
        .environmentObject(AuthViewModel())
}
