//
//  SignInWithAppleButtonCustom.swift
//  dog_gram
//
//  Created by Rick Brown on 19/09/2021.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonCustom: UIViewRepresentable {
  func makeUIView(context: Context) -> some ASAuthorizationAppleIDButton {
    return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {}
}
