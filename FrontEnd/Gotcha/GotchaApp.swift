//
//  GotchaApp.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct GotchaApp: App {
    init() {
        FirebaseApp.configure() //need PLIST
        

    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
