//
//  AuthenticationViewModel.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/20/22.
//

import Firebase
import GoogleSignIn

class AuthenticationViewModel: ObservableObject {

  // 1
  enum SignInState {
    case signedIn
    case signedOut
  }

  // 2
  @Published var state: SignInState = .signedOut
}

func signIn() {
  // 1
  if GIDSignIn.sharedInstance.hasPreviousSignIn() {
    GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
        authenticateUser(for: user, with: error)
    }
  } else {
    // 2
    guard let clientID = FirebaseApp.app()?.options.clientID else { return }
    
    // 3
    let configuration = GIDConfiguration(clientID: clientID)
    
    // 4
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
    guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
    
    // 5
    GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
      authenticateUser(for: user, with: error)
    }
  }
}
