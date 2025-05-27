//
//  Router.swift
//  Firebase
//
//  Created by Siddharth Bhayana on 26/05/25.
//
import SwiftUI
import Foundation

final class Router: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    enum AppFlow: Hashable, Codable {
        case signup
        case forgotPassword
        case recoveryEmailSent
    }
    
    func navigate(to destination: AppFlow) {
        navPath.append(destination)
//        screenEnteries.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath = .init()
    }
    
    func changeRoot(root newRoot: AppFlow) {
        navigateToRoot()
        navPath.append(newRoot)
    }
}
