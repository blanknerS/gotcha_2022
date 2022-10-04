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
    
    let signInConfig = GIDConfiguration(clientID: BuildConfig.googleKey) //configure OAuth to gotcha group
//    @State private var username = ""
//    @Binding var username: String
        
    let model_passed: UserAuthModel //get OAuth model from Main screen
    @Binding var UID: String
           
       fileprivate func SignOutButton() -> Button<Text> { //Signoutt button if needed in future
           Button(action: {
               model_passed.signOut()
           }) {
               Text("Sign Out")
           }
       }
       
       fileprivate func ProfilePic() -> some View { //get url of profile picture from user
           AsyncImage(url: URL(string: model_passed.profilePicUrl))
               .frame(width: 100, height: 100)
       }
       
       fileprivate func UserInfo() -> Text { //get email and name
           return Text(model_passed.email + " " + model_passed.givenName)
       }
    
    var body: some View {
        VStack{
            if(model_passed.isLoggedIn) { //if logged in
                UserInfo() //User Info
                SignOutButton() //Sign Out Button
            } else { //if not logged in:
                Button(action: { //OAUTH STUFF @Tommy haha
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
                              UID = model_passed.email
                          }
                }
                .onChange(of: model_passed.isLoggedIn) { newValue in //This is the cmopletino function!
                    if(model_passed.isLoggedIn){
                        UID = model_passed.email
                    } else{
                        print("err")
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
