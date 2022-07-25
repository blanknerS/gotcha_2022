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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//    @StateObject var model = UserAuthModel()
    init() {
        FirebaseApp.configure() //need PLIST
    }

    var body: some Scene {
        WindowGroup {
            ZStack{
                MainView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    static var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
