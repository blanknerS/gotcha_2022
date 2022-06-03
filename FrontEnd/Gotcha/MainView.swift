//
//  MainView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

import SwiftUI
import CoreHaptics

struct MainView: View {
    
    

    

    

    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
//    @State private var engine: CHHapticEngine?
//    @State private var leaderBoard: List = ["HEYYEH", "LWHEFL", "jf"]
    var body: some View {
        
        
        var name = ""

        
        let backgroundGradient = LinearGradient(
            colors: [Color("lightBlue"), Color("secondBlue")],
            startPoint: .top, endPoint: .bottom)
        TabView {
            ProfileView()
                .tabItem {
                    Label("Your Info", systemImage: "face.smiling.fill")}
            
            LeaderBoardView()
                .tabItem {
                    Label("Leaderboard", systemImage: "crown.fill")}
            TagOutView()
                .tabItem {
                    Label("Tag Out", systemImage: "xmark.seal.fill")}
            
                CountdownView(user: name, referenceDate: Date())
                .tabItem {
                    Label("Countdown", systemImage: "timer")}
                
        
//                .scaledToFit()
        }
        .accentColor(Color("mediumBlue"))
        .background(backgroundGradient)
        
        
    
        .onAppear{
            let user = "Andrew_Rodriguez23@milton.edu"

            Task{
                await print(firstName(uid: user))
                name = await firstName(uid: user)
            }
                        
                        
        }

    }
}



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
