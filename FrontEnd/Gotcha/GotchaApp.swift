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
    @StateObject var model = UserAuthModel()
    @State private var UID = ""
    init() {
        FirebaseApp.configure() //need PLIST
        _ = RCValues.sharedInstance
    }

    var body: some Scene {
        WindowGroup {
            ZStack{
                if !model.isLoggedIn{ // //if user NOT logged in
                    LoginView(model_passed: model, UID: $UID) //Login View
                        .onDisappear{UID = model.email}
                        .preferredColorScheme(.dark)
                }
                else{
                    MainView(model: model,UID: $UID)
                }
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    static var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
//    func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions
//          launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
//      ) -> Bool {
//        return true
//      }
}
