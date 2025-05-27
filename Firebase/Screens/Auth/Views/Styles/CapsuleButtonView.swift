//
//  CapsuleButtonView.swift
//  Firebase
//
//  Created by Siddharth Bhayana on 26/05/25.
//

// modifier
import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    var bgColor: Color = .teal
    var fontColor: Color = .white
    var hasBorder: Bool = false
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundStyle(fontColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Capsule().fill(bgColor))
            .scaleEffect(
                configuration.isPressed ? 0.95: 1
            )
            .overlay(
                hasBorder ?
                Capsule().stroke(.gray, lineWidth: 1):
                    nil
            )
    }
}
