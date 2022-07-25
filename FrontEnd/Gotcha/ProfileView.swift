//
//  ProfileView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/19/22.
//

import SwiftUI
import FirebaseFirestore

struct ProfileView: View {
    
    let model_passed: UserAuthModel //inherit model from Oauth
    @Binding var isOut_passed: Bool
    @Binding var glitch_bool: Bool
    
    @Binding var audioPlayer: AVAudioPlayer!
    
    @Binding var target_name: String
    @Binding var tag_count: Int
    
    var leaderBoard_pos: Int
    
    var body: some View {
        List{ //List SubView
            HStack(){
                Text("Profile")
                    .font(Font.title2.bold())
            }
            .listRowBackground(Color("darkGrey").opacity(0.0))
            VStack{
                Section(){ //SECTION: Profile
                    VStack {
                        VStack (alignment: .center){ //VSTACK: Image and UserName
                            HStack{ //Image
                                AsyncImage(url: URL(string: "\(model_passed.profilePicUrl)"))
//                                Image("google")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                            }
                            .padding(.bottom, 8)
    //                                Text("\(model_passed.givenName)") //name from Oauth Model
                            Text("Blake Ankner")
                                .font(.title)
                                .foregroundColor(Color("white"))
                                .cornerRadius(20)
                            
                            Text("#\(leaderBoard_pos) on leaderboard")
                                .font(.subheadline)
                                .foregroundColor(Color("titleGrey"))
//                                .padding(.top, 1)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding()
            }
            .listRowSeparator(.hidden)
            .padding()
            .background(Color("darkGrey"))
            .listRowBackground(Color("darkestGrey").opacity(0.0))
            .cornerRadius(UsefulValues.cornerRadius)
            
//            Spacer()
            
            HStack{
                VStack(alignment: .leading){ // Number of Tags
                    VStack{
                        HStack{
                            Text("Tag Count")
                                .font(Font.title2.bold())
                        }
//                        .padding(.bottom)
                        Text("\(tag_count)")
                            .foregroundColor(Color("titleGrey"))
                            .font(.system(size: 75, weight: .bold))
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .listRowSeparator(.hidden)
                    .background(Color("darkGrey"))
                    .cornerRadius(UsefulValues.cornerRadius)
                }
                .frame(width: 150, height: 200)
                
                Spacer()
                
                VStack(alignment: .leading){ //tag out button
                    VStack{
                        HStack(){
                            Text("Tag Out")
                                .font(Font.title2.bold())
                        }
                        TagButton(isIn: $isOut_passed, glitch_on: $glitch_bool, audioPlayer: $audioPlayer) //Special View for Tag Out Button
                            .frame(width:.infinity, height: .infinity)
                            .listRowBackground(Color("darkGrey"))
                            .padding()
                    }
    //                .frame(maxWidth: 100)
                    .listRowSeparator(.hidden)
                    .padding()
                    .background(Color("darkGrey"))
                    .cornerRadius(UsefulValues.cornerRadius)
                }
                .frame(maxWidth: 150)
            }
            .padding(.top, 10)
            .padding(.bottom, 5)
            .listRowSeparator(.hidden)
            .listRowBackground(Color("darkestGrey").opacity(0.0))
            
            HStack{
                VStack{
                    HStack(){
                        Text("Target")
                            .font(Font.title2.bold())
                    }
                    .padding(.bottom, 5)
                Text(target_name)
                        .font(.title2.italic())
                }
                .padding(.bottom, 5)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .listRowSeparator(.hidden)
            .background(Color("darkGrey"))
            .cornerRadius(UsefulValues.cornerRadius)
            .listRowBackground(Color("darkestGrey").opacity(0.0))
            
        }
        .background(Color("darkestGrey"))
        .listRowSeparator(.hidden)
        .onAppear(){
            UITableView.appearance().backgroundColor = UIColor(Color("darkestGrey")) //change View Backgrounnd
           
        }
//        .background(Color("green"))
    }
}

//Specialized Tag Out Button

import AVKit

struct TagButton: View {
    
    @State private var pressing: Bool = false
    @State var progress: CGFloat = 0.0
    @State var circleProgress: CGFloat = 0.0
    
    @Binding var isIn: Bool
    @Binding var glitch_on: Bool
    
    @State private var isDetectingLongPress = false
    
    @Binding var audioPlayer: AVAudioPlayer!
    
    var body: some View {
            VStack {  // VSTACK: Button and Tagginng Out Texts
                ZStack {  // Button Back and the Spining Button
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    Circle()  // Background circle
                        .foregroundColor(Color("offGrey"))
                    Circle()  // Surrounding circle trimline: moves from 0 position to 100
                        .trim(from: 0.0, to: circleProgress)
                        .stroke(Color("salmon"), lineWidth: 5)
                        .frame(width: .infinity, height: .infinity)  // Slightly larger than prev. circle
                        .rotationEffect(Angle(degrees: -90))
                    
                    Image(systemName: isIn ? "checkmark.seal.fill" : "xmark.seal.fill")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .foregroundColor(isDetectingLongPress ? Color("salmon") : Color("lightGrey"))
                        .rotationEffect(.degrees(isDetectingLongPress ? 360 : 0))
                        .animation(isDetectingLongPress ?
                                   Animation.easeInOut(duration: 1.5)
                                        .repeatCount(2, autoreverses: true) : nil)
                                .onLongPressGesture(minimumDuration: 3.0, maximumDistance: 100 ,pressing: { (isPressing) in
                                    self.isDetectingLongPress = isPressing
                                }, perform: {
                                    self.audioPlayer.play()
                                    impactMed.impactOccurred()
                                    isIn.toggle() //TAG OUT = TRUE
                                    glitch_on.toggle()
                                    self.startLoading()
                                  
                                })
                    }
            }
            .scaledToFit()
            .frame(width:100, height:100)
            .onAppear(){
                let sound = Bundle.main.path(forResource: "death-audio", ofType: "mp3")
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                } catch(let error) {
                    print(error.localizedDescription)
                }
            }
        }
    
//    Count if pressed button for enough time
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in  // Timer based - adds every 0.1sec held down
                withAnimation() {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    if self.circleProgress == 1.0{
                    }
                    if pressing{
                        if self.circleProgress <= 1.0{
                            self.circleProgress += 0.02
                        }
                        if self.circleProgress >= 1.0{
                            timer.invalidate()
                        }
                        if self.circleProgress >= 0.5{
                            impactMed.impactOccurred()
                        }
                    }
                    if pressing == false{
                        if self.circleProgress > 0{
                            self.circleProgress -= 0.025
                        }
                    }
                }
            }
        }
}

////Preview Provider
//struct ProfileView_Previews: PreviewProvider {
////    @StateObject var model = UserAuthModel()
//    static var previews: some View {
//        ProfileView(isOut_passed: .constant(false), glitch_bool: .constant(false), target_name: .constant("Blake"), tag_count: .constant(10), leaderBoard_pos: 5)
//            .preferredColorScheme(.dark)
//            .previewInterfaceOrientation(.portrait)
//    }
//}
