//
//  MainView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

//POWERUP SIDE SCROLLER:: https://blog.techchee.com/list-and-scrollview-in-swiftui/#:~:text=To%20have%20a%20horizontal%20ScrollView%2C

import SwiftUI
import CoreHaptics
import AVKit

struct MainView: View {
    
    @StateObject var model = UserAuthModel() //Make object of the Auth Model
    @State private var isOut: Bool = false
    @State private var show_glitch_screen: Bool = false
    @State private var show_tag_screen: Bool = true
    
    @State var audioPlayer: AVAudioPlayer!
    
    @State private var target_name: String
    @State private var tag_count: Int
    @State private var target_email: String
    
    var body: some View {
                
        VStack{
            ZStack{ //Builds back to front as it reads
                if model.isLoggedIn{ //if the user is logged in through oauth
                    TabView { //make tab view with:
                        if !isOut{ //only show if not tagged out !!CHANGE TO DB!!
                            ProfileView(model_passed: model, isOut_passed: $isOut, glitch_bool: $show_glitch_screen, audioPlayer: $audioPlayer) //Profile View
    //                        ProfileView()
                                .preferredColorScheme(.dark)
                                .tabItem { //added to tab bar @ bottom of screen
                                    Label("Your Info", systemImage: "face.smiling.fill")}
                        }
                        
                        LeaderBoardView() //Leader Board View
                            .preferredColorScheme(.dark)
                            .tabItem { //added to tab bar @ bottom of screen
                                Label("Leaderboard", systemImage: "crown.fill")}
                        
                        CountdownView(user: model.givenName, referenceDate: Date()) //Countdown View !!WONT BE HERE IN REAL APP!! !!NEED T PASS OUR STORED NAME NOT FROM GOOGLE!!
                            .preferredColorScheme(.dark)
                            .tabItem { //added to tab bar @ bottom of screen
                                Label("Countdown", systemImage: "timer")}

                    }
                    .accentColor(Color("secondBlue")) //tab bar button color when tab is being viewed
                }
//                Conditional LoginView display
                if !model.isLoggedIn{ // //if user NOT logged in
                    LoginView(model_passed: model) //Login View
                        .preferredColorScheme(.dark)
                }
                if isOut{
                    ZStack{
                        
                        TabView{
                            LeaderBoardView() //Leader Board View
                                .preferredColorScheme(.dark)
                                .tabItem { //added to tab bar @ bottom of screen
                                    Label("Leaderboard", systemImage: "crown.fill")}
                        }
                        .accentColor(Color("secondBlue")) //tab bar button color when tab is being viewed
                        
                        if show_tag_screen{
                            VStack{
                                TaggedOutView(tagged_view: $show_tag_screen, audioPlayer: $audioPlayer)
                            .background(.black)
                            .frame(width: .infinity, height: .infinity, alignment: .center)
                            
                            }
                        }
                        if show_glitch_screen{
                            VStack{
                                GifImageView(name: "death-gif-4")
                                    .frame(width: .infinity, height: .infinity, alignment: .center)
                                GifImageView(name: "death-gif-4")
                                    .frame(width: .infinity, height: .infinity, alignment: .bottom)
                                    .offset(y: -15)
                            }
                            .background(Color("black"))
                            .frame(width: .infinity, height: .infinity, alignment: .center)
                            .onAppear {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                                self.show_glitch_screen.toggle()
                                            }
                                        }
                            }
                    }
                }
            }
        }
        .onAppear{ //when screen is first shown LOAD THE USER INFO ONCE!
            
       
        }
        .refreshable { //when the screen is reloaded
        //            reload the user information here
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
