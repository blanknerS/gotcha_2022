//
//  AppleSignIn_View.swift
//  Gotcha
//
//  Created by Blake Ankner on 10/19/22.


import SwiftUI
import AuthenticationServices


// 1
struct SignInWithApple: UIViewRepresentable {
  // 2
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    // 3
    return ASAuthorizationAppleIDButton()
  }
  
  // 4
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
  }
}
