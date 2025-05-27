//
//  ProfileView.swift
//  FirebaseAppiOS
//
//  Created by Siddharth Bhayana on 27/05/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack(
                        spacing: 16
                    ) {
                        Text(
                            user.initials
                        )
                        .font(
                            .title
                        )
                        .fontWeight(
                            .semibold
                        )
                        .foregroundStyle(
                            .white
                        )
                        .frame(
                            width: 70,
                            height: 70
                        )
                        .background(
                            Color(
                                .lightGray
                            )
                        )
                        .clipShape(
                            Circle()
                        )
                        
                        VStack(
                            alignment: .leading,
                            spacing: 4
                        ) {
                            Text(
                                user.name
                            )
                            .font(
                                .subheadline
                            )
                            .fontWeight(
                                .semibold
                            )
                            Text(
                                user.email
                            )
                            .font(
                                .footnote
                            )
                        }
                    }
                }
                
                Section(
                    "Accounts"
                ) {
                    Button {
                        viewModel
                            .logout()
                        
                    } label: {
                        Label(
                            "Sign Out",
                            systemImage: "arrow.left.circle.fill"
                        )
                        .foregroundStyle(
                            .black,
                            .red
                        )
                    }
                    
                    Button {
                        Task {
                            await viewModel.deleteAccount()
                        }
                    } label: {
                        Label(
                            "Delete account",
                            systemImage: "xmark.circle.fill"
                        )
                        .foregroundStyle(
                            .black,
                            .red
                        )
                    }
                }
            }
        } else {
            ProgressView(
                "Please wait..."
            )
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(
            AuthViewModel()
        )
}
