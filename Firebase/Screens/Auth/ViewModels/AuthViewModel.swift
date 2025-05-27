//
//  AuthViewModel.swift
//  FirebaseAppiOS
//
//  Created by Siddharth Bhayana on 26/05/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor // shift bg thread to main
final class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User? // firebase's user
    @Published var currentUser: User? // current user in the app
    @Published var isError: Bool = false
    
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init() {
        Task {
            await fetchCurrentUser()
        }
    }
    
    func fetchCurrentUser() async {
        if let user = auth.currentUser {
            userSession = user
            await fetchUserDetails(uid: user.uid)
        }
    }
    
    
    func login(
        email: String,
        password: String
    ) async {
        do {
            let authResult = try await auth.signIn(
                withEmail: email,
                password: password
            )
            self.userSession = authResult.user
            await fetchUserDetails(
                uid: authResult.user.uid
            )
        }catch {
            isError = true
        }
    }
    
    func createUser(
        email: String,
        name: String,
        password: String
    ) async {
        do {
            let authResult = try await auth.createUser(
                withEmail: email,
                password: password
            )
            await storeUserDetails(
                uid: authResult.user.uid,
                email: email,
                name: name
            )
        }catch {
            isError = true
        }
    }
    
    
    func fetchUserDetails(
        uid: String
    ) async {
        do {
            let document = try await firestore.collection(
                "users"
            ).document(
                uid
            ).getDocument()
            currentUser = try document
                .data(
                    as: User.self
                )
        }catch {
            isError = true
        }
    }
    
    func storeUserDetails(
        uid: String,
        email: String,
        name: String
    ) async{
        let user = User(
            uid: uid,
            email: email,
            name: name
        )
        do {
            try firestore
                .collection(
                    "users"
                )
                .document(
                    uid
                )
                .setData(
                    from: user
                )
        }catch {
            isError = true
        }
    }
    
    func logout(){
        do {
            currentUser = nil
            userSession = nil
            try auth
                .signOut()
        }catch {
            isError = true
        }
    }
    
    func resetPassword(
        by email: String
    ) async {
        do {
            try await auth.sendPasswordReset(
                withEmail: email
            )
        } catch {
            isError = true
        }
    }
    
    func deleteAccount() async {
        do {
            currentUser = nil
            userSession = nil
            deleteUserFromFireStore(by: auth.currentUser?.uid ?? "")
            try await auth.currentUser?.delete()
        } catch {
            isError = true
        }
    }
    
    private func deleteUserFromFireStore(by uid: String) {
        firestore.collection("users").document(uid).delete()
    }
}
