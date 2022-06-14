//
//  MainView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

//POWERUP SIDE SCROLLER:: https://blog.techchee.com/list-and-scrollview-in-swiftui/#:~:text=To%20have%20a%20horizontal%20ScrollView%2C

import SwiftUI
import CoreHaptics

struct MainView: View {
    
    @StateObject var model = UserAuthModel() //Make object of the Auth Model
    
    
    var body: some View {
                
        VStack{
            ZStack{ //Builds back to front as it reads
                if model.isLoggedIn{ //if the user is logged in through oauth
                    TabView { //make tab view with:
                        ProfileView(model_passed: model) //Profile View
//                        ProfileView()
                            .preferredColorScheme(.dark)
                            .tabItem { //added to tab bar @ bottom of screen
                                Label("Your Info", systemImage: "face.smiling.fill")}
                        
                        LeaderBoardView() //Leader Board View
                            .preferredColorScheme(.dark)
                            .tabItem { //added to tab bar @ bottom of screen
                                Label("Leaderboard", systemImage: "crown.fill")}
                        
                        CountdownView(user: model.givenName, referenceDate: Date()) //Countdown View !!WONT BE HERE IN REAL APP!! !!NEED T PASS OUR STORED NAME NOT FROM GOOGLE!!
                            .preferredColorScheme(.dark)
                            .tabItem { //added to tab bar @ bottom of screen
                                Label("Countdown", systemImage: "timer")}

                    }
                    .accentColor(Color("mediumBlue")) //tab bar button color when tab is being viewed
                }
//                Conditional LoginView display
                if !model.isLoggedIn{ // //if user NOT logged in
                    LoginView(model_passed: model) //Login View
                        .preferredColorScheme(.dark)
                }
            }
        }
        .onAppear{ //when screen is shown
            let user = "Andrew_Rodriguez23@milton.edu" //pass user name for cuontdown !!change it to model.givenName!!

            Task{ //tasks to backend
                await print(firstName(uid: user))
            }
        }
    }
}

//Preview provider
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
