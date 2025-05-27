//
//  LoginRouter.swift
//  Firebase
//
//  Created by Siddharth Bhayana on 26/05/25.
//
import SwiftUI

extension Router {
    
    @ViewBuilder
    func destination(for flow: AppFlow) -> some View {
        switch flow {
        case .signup:
            SignInView()
            
        case .forgotPassword:
            ForgotPasswordView()
            
        case .recoveryEmailSent:
            EmailSentView()
        }
    }
}

