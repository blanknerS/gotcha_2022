//
//  LoginView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    //DONT PUSH + make secure!
    let signInConfig = GIDConfiguration(clientID: BuildConfig.googleKey) //clietn ID that I already have, OAuth with app --> kinda API key
//    @StateObject var userAuth: UserAuthModel =  UserAuthModel() //this is the variable which calls the UserAuth File
    @State private var username = ""
    
    let model_passed: UserAuthModel

       
       fileprivate func SignOutButton() -> Button<Text> {
           Button(action: {
               model_passed.signOut()
           }) {
               Text("Sign Out")
           }
       }
    
       
       fileprivate func ProfilePic() -> some View {
           AsyncImage(url: URL(string: model_passed.profilePicUrl))
               .frame(width: 100, height: 100)
       }
       
       fileprivate func UserInfo() -> Text {
           return Text(model_passed.email + " " + model_passed.givenName)
           
       }
    
    var body: some View {
        VStack{
            if(model_passed.isLoggedIn) {
                UserInfo()
                SignOutButton()
            } else {
                Button(action: {
                    model_passed.signIn()}, label: {Image(uiImage: UIImage(named: "google")!)
                       .resizable()
                       .frame(maxWidth: 200, maxHeight:200)
                       .scaledToFit()})
                Text("Log In")
                    .foregroundColor(Color("lightGrey"))
                    .font(.title)
                    .padding()
           }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("darkGrey"))
        .onOpenURL { url in
                          GIDSignIn.sharedInstance.handle(url)
                        }
                .onAppear {
                          GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                            // Check if `user` exists; otherwise, do something with `error`
                          }
                }
                .onChange(of: model_passed.isLoggedIn) { newValue in //This is the cmopletino function!
                    if(model_passed.isLoggedIn){
//                        need a refresh here I think
                        username = model_passed.email
                        print("logged in: " + username)
                    } else {
                        username = ""
                        print("logged out: " + username)
                    }
                }
                    
                        
                .environmentObject(model_passed)
    }
    
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(model: model)
//    }
//}
