//
//  MainView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

import SwiftUI
import CoreHaptics

struct MainView: View {
    
    @StateObject var model = UserAuthModel() //Make object of the Auth Model
    
    
    var body: some View {
        
        var name = "" //variale that is passed into countdown view
        
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
                        
                            CountdownView(user: name, referenceDate: Date()) //Countdown View !!WONT BE HERE IN REAL APP!!
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



















//            Button(action: {
//                prepareHaptics()
//                showPopUp = true
//                complexSuccess()
//
//            }) {
//                Text("Tag Out")
//                    .frame(width: 100, height: 100)
//                    .foregroundColor(Color.black)
//                    .background(Color("background"))
//                    .clipShape(Circle())
//                    .shadow(color: Color("lightShadow"), radius: 8, x: -8, y: -8)
//                    .shadow(color: Color("darkShadow"), radius: 8, x: 8, y: 8)
//            }
//        .sheet(isPresented: $showPopUp) {
//            NavigationView{
//                TagOutView()
//            }
//        }


//    hpatic functions
//    func prepareHaptics() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//
//        do {
//            engine = try CHHapticEngine()
//            try engine?.start()
//        } catch {
//            print("There was an error creating the engine: \(error.localizedDescription)")
//        }
//    }
//
//    func complexSuccess() {
//        // make sure that the device supports haptics
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        var events = [CHHapticEvent]()
//
//        // create one intense, sharp tap
//        for i in stride(from: 0, to: 3, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
//            events.append(event)
//        }
//
//        for i in stride(from: 0, to: 3, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
//            events.append(event)
//        }
//
//        // convert those events into a pattern and play it immediately
//        do {
//            let pattern = try CHHapticPattern(events: events, parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription).")
//        }
//    }
