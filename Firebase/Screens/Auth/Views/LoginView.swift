//
//  LoginView.swift
//  Firebase
//
//  Created by Siddharth Bhayana on 26/05/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var router: Router
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                Image(.loginImg)
                    .resizable()
                    .scaledToFit()
                
                Text("Let's Connect!")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer().frame(
                    height: 12
                )
                
                InputView(placeHolder: "Email or phone number", text: $email)
                InputView(placeHolder: "Password", text:$password, isSecureFeild: true)
                
                HStack{
                    Spacer()
                    Button {
                        router.navigate(to: .forgotPassword)
                    } label: {
                        Text("Forgot Password?")
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
                
                Button {
                    Task {
                        await viewModel.login(email: email, password: password)
                    }
                } label: {
                    Text("Login")
                }
                .buttonStyle(
                    CapsuleButtonStyle()
                )
                
                Spacer()
                
                HStack(spacing: 16) {
                    LineView()
                    Text("or")
                    LineView()
                }
                .foregroundStyle(.gray)
                .fontWeight(.semibold)
                
                Button {
                    
                }
                label: {
                    Label("Sign up with Apple", systemImage: "apple.logo")
                }
                .buttonStyle(CapsuleButtonStyle(
                    bgColor: .black
                ))
                
                Button {
                    Task {
                        await viewModel.login(email: email, password: password)
                    }
                }
                label: {
                    HStack {
                        Image(.loginImg)
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("Sign up with Google")
                    }
                }
                .buttonStyle(
                    CapsuleButtonStyle(
                        bgColor: .clear,
                        fontColor: .black,
                        hasBorder: true
                    )
                )
                
                Spacer().frame(height: 32)
                
                HStack {
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .onTapGesture {
                            router.navigate(to: .signup)
                        }
                }
                    
            }
        }
        .ignoresSafeArea()
        .padding()
        .padding(.horizontal, 8)
        .alert("Something went wrong", isPresented: $viewModel.isError) {}
    }
}


#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
