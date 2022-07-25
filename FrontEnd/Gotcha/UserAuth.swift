//
//  UserAuth.swift
//  Gotcha
//
//  Created by Blake Ankner on 6/7/22.
//

//
//  UserAuthModel.swift
//  practice
//
//  Created by Tommy Hong on 5/24/22.
//
 
import Foundation
import SwiftUI
import GoogleSignIn
 
class UserAuthModel: ObservableObject {
    
    @Published var givenName: String = ""
    @Published var email: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    @Published var partOfMilton: Bool = false
    
    init(){
        check()
    }
    
    func checkStatus(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            let givenName = user.profile?.givenName
            let email = user.profile?.email
            let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
            self.givenName = givenName ?? ""
            self.email = email ?? ""
            self.profilePicUrl = profilePicUrl
            self.isLoggedIn = true
            if self.email.contains("milton.edu"){
                self.partOfMilton = true
            }
            else{
                self.partOfMilton = false
                self.signOut()
            }
//            print(partOfMilton)
            
        }else{
            self.isLoggedIn = false
            self.givenName = "Not Logged In"
            self.email = ""
            self.profilePicUrl =  ""
            self.partOfMilton = false
        }
    }
    
    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            
            self.checkStatus()
        }
    }
    
    func signIn(){
        
       guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
 
        let signInConfig = GIDConfiguration.init(clientID: BuildConfig.googleKey)
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController,
            callback: { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                self.checkStatus()
            }
        )
    }
    
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}

