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
                        .onDisappear{
<<<<<<< Updated upstream
                            UID = model.email
                            print("LoginView CLOSED ----GotchaApp")

                        }
=======
                            UID = model.email}
>>>>>>> Stashed changes
                        .preferredColorScheme(.dark)
                        .onAppear{
                            print("LoginView should be showing ----GotchaApp")
                        }
                }
                else{
                    MainView(model: model,UID: $UID)
                        .onAppear{
                            print("\n\nMainView should be showing ----GotchaApp")
                        }
                        .onDisappear{
                            print("MainView CLOSED ----GotchaApp")
                        }
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
