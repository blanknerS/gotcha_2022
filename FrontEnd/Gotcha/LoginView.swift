//
//  LoginView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//  Modifed by Ben Rhodes-Kropf on 10/8/23

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    
    let signInConfig = GIDConfiguration(clientID: BuildConfig.googleKey) //configure OAuth to gotcha group
    let model_passed: UserAuthModel //get OAuth model from Main screen
    @Binding var UID: String
    
    // Print for checking clientID configuration
    init(model_passed: UserAuthModel, UID: Binding<String>) {
        self.model_passed = model_passed
        self._UID = UID
        print("Client ID for OAuth: \(BuildConfig.googleKey)")
    }
        
    fileprivate func SignOutButton() -> Button<Text> { //Signoutt button if needed in future
        Button(action: {
            print("Sign Out button pressed.")
            model_passed.signOut()
        }) {
            Text("Sign Out")
        }
    }
       
    fileprivate func ProfilePic() -> some View { //get url of profile picture from user
        print("Fetching profile pic with URL: \(model_passed.profilePicUrl)")
        return AsyncImage(url: URL(string: model_passed.profilePicUrl))
                   .frame(width: 100, height: 100)
    }
       
    fileprivate func UserInfo() -> Text { //get email and name
        print("Fetching user info: \(model_passed.email) \(model_passed.givenName)")
        return Text(model_passed.email + " " + model_passed.givenName)
    }
    
    var body: some View {
        VStack{
            if(model_passed.isLoggedIn) { //if logged in
                UserInfo() //User Info
                SignOutButton() //Sign Out Button
            } else { //if not logged in:
                Button(action: { //OAUTH STUFF @Tommy haha
                    print("Attempting to sign in via OAuth.")
                    model_passed.signIn()}, label: {
                        Image(uiImage: UIImage(named: "google")!)
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
            print("Handling URL: \(url)")
            GIDSignIn.sharedInstance.handle(url)
        }
        .onAppear {
            print("LoginView appeared. Restoring previous sign in.")
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                UID = model_passed.email
            }
        }
        .onChange(of: model_passed.isLoggedIn) { newValue in //This is the cmopletino function!
            if(model_passed.isLoggedIn){
                print("User has logged in. UID updated.")
                UID = model_passed.email
            } else{
                print("Error: User not logged in.")
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
