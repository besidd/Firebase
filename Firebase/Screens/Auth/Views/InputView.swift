//
//  InputView.swift
//  Firebase
//
//  Created by Siddharth Bhayana on 26/05/25.
//

import SwiftUI

struct InputView: View {
    
    let placeHolder: String
    @Binding var text: String
    var isSecureFeild: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            if (isSecureFeild) {
                SecureField(placeHolder, text: $text)
            } else {
                TextField(placeHolder, text: $text)
            }
            
            Divider()
        }
    }
    
        
}

#Preview {
    InputView(
        placeHolder: "Sample",
        text: .constant("")
    )
}
