//
//  EmailSentView.swift
//  FirebaseAppiOS
//
//  Created by Siddharth Bhayana on 27/05/25.
//

import SwiftUI

struct EmailSentView: View {
    @EnvironmentObject var viewmodel: AuthViewModel
    @EnvironmentObject var router: Router
    var body: some View {
        VStack (spacing: 24) {
            
            Spacer()
            
            Image(systemName: "envelope.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
                .foregroundColor(.teal)
            
            VStack(spacing: 8) {
                Text("Check your email")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("We've sent a password recovery email to your email address.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            
            Button{
                router.navigateToRoot()
            }
            label: {
                Text("Skip, I'll log in later")
            }
            .buttonStyle(CapsuleButtonStyle())
            
            Spacer()
            
            Button{
                router.navigateBack()
            }
            label: {
                Text("Didn't recieve email, ")
                    .foregroundColor(.gray)
                +
                Text("try another email address.")
                    .foregroundColor(.teal)
                
            }
        }
        .toolbarRole(.editor)
        .padding()
    }
}

#Preview {
    EmailSentView()
        .environmentObject(AuthViewModel())
}
