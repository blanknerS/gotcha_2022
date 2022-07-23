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
    @State private var isIn: Bool = true
    @State private var show_glitch_screen: Bool = false
    @State private var show_tag_screen: Bool = true
    @State private var isLoading: Bool = true
    @State private var gotchaTime: Bool = false
    
    @State var audioPlayer: AVAudioPlayer!
    
    @State private var target_name: String =  ""
    @State private var tag_count: Int = 0
    @State private var target_email: String = ""
    @State private var UID: String = "Andrew_Rodriguez23@milton.edu"
    @State private var hasLastWords: Bool = false
    
    let game_started = UserDefaults.standard.bool(forKey: "game_on")
    
    var body: some View {
                
        VStack{
            ZStack{ //Builds back to front as it reads
                if model.isLoggedIn && model.partOfMilton{ //if the user is logged in through oauth
                    TabView { //make tab view with:
                        if isIn{ //only show if not tagged out !!CHANGE TO DB!!
                            ProfileView(model_passed: model, isOut_passed: $isIn, glitch_bool: $show_glitch_screen,audioPlayer: $audioPlayer, target_name: $target_name, tag_count: $tag_count,leaderBoard_pos: 10) //Profile View
    //                        ProfileView()
                                .preferredColorScheme(.dark)
                                .tabItem { //added to tab bar @ bottom of screen
                                    Label("Your Info", systemImage: "face.smiling.fill")}
                        }
                        
                        LeaderBoardView() //Leader Board View
                            .preferredColorScheme(.dark)
                            .tabItem { //added to tab bar @ bottom of screen
                                Label("Leaderboard", systemImage: "crown.fill")}
                        
                        SignOutView(model_passed: model) //Leader Board View
                            .preferredColorScheme(.dark)
                            .tabItem { //added to tab bar @ bottom of screen
                                Label("Sign Out", systemImage: "person.crop.circle.fill.badge.xmark")}

                    }
                    .accentColor(Color("secondBlue")) //tab bar button color when tab is being viewed
                }
//                Conditional LoginView display
                if !model.isLoggedIn{ // //if user NOT logged in
                    LoginView(model_passed: model) //Login View
                        .preferredColorScheme(.dark)
                }
                if !isIn && model.partOfMilton && model.isLoggedIn{
                    ZStack{
                        TabView{
                            LeaderBoardView() //Leader Board View
                                .preferredColorScheme(.dark)
                                .tabItem { //added to tab bar @ bottom of screen
                                    Label("Leaderboard", systemImage: "crown.fill")}
                            
                            SignOutView(model_passed: model) //Leader Board View
                                .preferredColorScheme(.dark)
                                .tabItem { //added to tab bar @ bottom of screen
                                    Label("Sign Out", systemImage: "person.crop.circle.fill.badge.xmark")}
                        }
                        .accentColor(Color("secondBlue")) //tab bar button color when tab is being viewed
                        
                        if !hasLastWords{
                            if show_tag_screen{
                                VStack{
                                    TaggedOutView(tagged_view: $show_tag_screen, audioPlayer: $audioPlayer, UID: $UID)
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
                if !gotchaTime && !game_started{
                    CountdownView(user: model.givenName, dDay: $gotchaTime, referenceDate: Date()) //Countdown View !!WONT BE HERE IN REAL APP!! !!NEED T PASS OUR STORED NAME NOT FROM GOOGLE!!
                        .preferredColorScheme(.dark)
                        .tabItem { //added to tab bar @ bottom of screen
                            Label("Countdown", systemImage: "timer")}
                }
                if isLoading{
                    LoadingView()
                }
            }
        }
        .onAppear{ //when screen is first shown LOAD THE USER INFO ONCE!
            
//            UserDefaults.standard.set(false, forKey: "game_on")
            
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            AppDelegate.orientationLock = .portrait
            
            Task{ //tasks to backend
        
                target_name = await fullName(uid: targ(uid: UID))
                tag_count = await tags(uid: UID)
                
                isIn = await lifeStatus(uid: UID)
                                
                let lastWords = await lWStatus(uid: UID)
                if lastWords != ""{
                    hasLastWords = true
                }
                
                print(gotchaTime)
                
                if target_name != nil && tag_count != nil && isIn != nil && lastWords != nil && model.isLoggedIn != nil && game_started != nil{
                    self.isLoading.toggle()
                }
                
             
            }
        }
        .refreshable { //when the screen is reloaded
        //            reload the user information here
                }
    }
}

struct UsefulValues {
    static var cornerRadius = 30.0
}

////Preview provider
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//            .preferredColorScheme(.dark)
//    }
//}
