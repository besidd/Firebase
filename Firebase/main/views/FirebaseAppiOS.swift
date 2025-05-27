//
//  FirebaseApp.swift
//  Firebase
//
//  Created by Siddharth Bhayana on 26/05/25.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseAppiOS
            .configure()
        return true
    }
}

@main
struct FirebaseAppiOS: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @ObservedObject private var router = Router()
    var body: some Scene {
       WindowGroup {
                NavigationStack(path: $router.navPath) {
                LoginView()
                        .navigationDestination(for: Router.AppFlow.self) { destination in
                            router.destination(for: destination)
                            }
            }
        }.environmentObject(router)

    }
}
