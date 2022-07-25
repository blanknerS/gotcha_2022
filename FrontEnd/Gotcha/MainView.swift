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
        
    let model: UserAuthModel //Make object of the Auth Model
    @State private var isIn: Bool = true
    @State private var show_glitch_screen: Bool = false
    @State private var show_tag_screen: Bool = true
    @State private var isLoading: Bool = true
    @State private var gotchaTime: Bool = false
    @State private var hasLastWords: Bool = false
    
    @State var audioPlayer: AVAudioPlayer!
    
    @State private var target_name: String =  ""
    @State private var tag_count: Int = 0
    @State private var target_email: String = ""
    @State private var numTabs: Int = 3
    @Binding  var UID: String
    @State private var full_name: String = ""
    
    @State private var selectedTab = 0
    
    let game_started = UserDefaults.standard.bool(forKey: "game_on")
    let minDragTranslationForSwipe: CGFloat = 50
    
    
    var body: some View {
                
        VStack{
            ZStack{ //Builds back to front as it reads
                if model.isLoggedIn && model.partOfMilton{ //if the user is logged in through oauth
                    TabView(selection: $selectedTab){ //make tab view with:
                        if isIn{
                            ProfileView(model_passed: model, isOut_passed: $isIn, glitch_bool: $show_glitch_screen,audioPlayer: $audioPlayer, target_name: $target_name, tag_count: $tag_count, name: $full_name,leaderBoard_pos: 10) //Profile View
    //                        ProfileView()
                                .onAppear{
//                                    print(UID + "<-- UID")
                                }
                                .preferredColorScheme(.dark)
                                .tabItem { //added to tab bar @ bottom of screen
                                    Image(systemName: "person.fill")
                                }
                                .tag(0)
                                .highPriorityGesture(DragGesture().onEnded({self.handleSwipe(translation: $0.translation.width)}))
                        }
                        
                        LeaderBoardView() //Leader Board View
                            .preferredColorScheme(.dark)
                            .tabItem { //added to tab bar @ bottom of screen
                                Image(systemName: "crown.fill")
                            }
                            .tag(1)
                            .highPriorityGesture(DragGesture().onEnded({self.handleSwipe(translation: $0.translation.width)}))
                        
                        SignOutView(model_passed: model) //Leader Board View
                            .preferredColorScheme(.dark)
                            .tabItem { //added to tab bar @ bottom of screen
                                Image(systemName: "person.crop.circle.fill.badge.xmark")
                            }
                            .tag(2)
                            .highPriorityGesture(DragGesture().onEnded({self.handleSwipe(translation: $0.translation.width)}))
                    }
                    .accentColor(Color("white")) //tab bar button color when tab is being viewed
                }
//                Conditional LoginView display
                if !isIn && model.partOfMilton && model.isLoggedIn{
                    ZStack{
                        TabView(selection: $selectedTab){
                            LeaderBoardView() //Leader Board View
                                .preferredColorScheme(.dark)
                                .tabItem { //added to tab bar @ bottom of screen
                                    Label("Leaderboard", systemImage: "crown.fill")
                                }
                                .tag(0)
                                .highPriorityGesture(DragGesture().onEnded({self.handleSwipe(translation: $0.translation.width)}))
                            
                            SignOutView(model_passed: model) //Leader Board View
                                .preferredColorScheme(.dark)
                                .tabItem { //added to tab bar @ bottom of screen
                                    Label("Sign Out", systemImage: "person.crop.circle.fill.badge.xmark")
                                }
                                .tag(1)
                                .highPriorityGesture(DragGesture().onEnded({self.handleSwipe(translation: $0.translation.width)}))
                        }
                        .accentColor(Color("secondBlue")) //tab bar button color when tab is being viewed
                        
                        if !hasLastWords{
                            if show_tag_screen{
                                VStack{
                                    TaggedOutView(model_passed: model, tagged_view: $show_tag_screen, name: $full_name, audioPlayer: $audioPlayer)
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
                    CountdownView(model: model, dDay: $gotchaTime, name: $full_name,referenceDate: Date()) //Countdown View !!WONT BE HERE IN REAL APP!! !!NEED T PASS OUR STORED NAME NOT FROM GOOGLE!!
                        .preferredColorScheme(.dark)
                        .tabItem { //added to tab bar @ bottom of screen
                            Label("Countdown", systemImage: "timer")
                        }
                }
                if isLoading{
                    LoadingView()
                        .onAppear{
                            Task{ //tasks to backend
                                
                //                UID = model.email
                                if model.isLoggedIn{
                                    target_name = await fullName(uid: targ(uid: UID))
                                    tag_count = await tags(uid: UID)
                                    
                                    full_name = await fullName(uid: UID)
                                    
                                    isIn = await lifeStatus(uid: UID)
                                    
                                    if !isIn{
                                        numTabs = 2
                                    }
                                    else{
                                        numTabs = 3
                                    }
                                                    
                                    let lastWords = await lWStatus(uid: UID)
                                    if lastWords != ""{
                                        hasLastWords = true
                                    }
                                    
//                                    print(gotchaTime)
                                    
                                    if target_name != nil && tag_count != nil && isIn != nil && lastWords != nil && model.isLoggedIn != nil && game_started != nil{
//                                        print("In here")
                                        self.isLoading.toggle()
                                    }
                                }
                            }
                        }
                }
//                if !model.isLoggedIn{ // //if user NOT logged in
//                    LoginView(model_passed: model, UID: $UID) //Login View
//                        .preferredColorScheme(.dark)
//                }
            }
        }
        .onAppear{ //when screen is first shown LOAD THE USER INFO ONCE!
            
//            UserDefaults.standard.set(false, forKey: "game_on")
            
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color("mediumGrey"))
            
            AppDelegate.orientationLock = .portrait
        }
        .refreshable { //when the screen is reloaded
            if model.isLoggedIn{
                target_name = await fullName(uid: targ(uid: UID))
                tag_count = await tags(uid: UID)
                
                isIn = await lifeStatus(uid: UID)
            }
        }
    }
    private func handleSwipe(translation: CGFloat) {
        if translation > minDragTranslationForSwipe && selectedTab > 0 {
            selectedTab -= 1
        } else  if translation < -minDragTranslationForSwipe && selectedTab < numTabs-1 {
            selectedTab += 1
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
