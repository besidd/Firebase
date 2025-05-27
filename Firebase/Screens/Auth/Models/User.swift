//
//  User.swift
//  FirebaseAppiOS
//
//  Created by Siddharth Bhayana on 26/05/25.
//

import Foundation

struct User: Codable {
    let uid: String
    let email: String
    let name: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: name) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
