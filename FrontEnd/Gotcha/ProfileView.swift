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
    
    var body: some View {
        List{ //List SubView
            Section(){ //SECTION: Profile
                VStack {
                    VStack(alignment: .leading){ //custom Section Label
                        Label("Profile", systemImage: "person.circle.fill")
                            .foregroundColor(Color("lightGrey"))
                    }
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    VStack (alignment: .center){ //VSTACK: Image and UserName
                        HStack{ //Image
                                AsyncImage(url: URL(string: "\(model_passed.profilePicUrl)"))
//                            Image("google")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                        }
                        HStack{ //Name
                                Text("\(model_passed.givenName)") //name from Oauth Model
//                            Text("BLAKE")
                                .font(.title)
                                .foregroundColor(Color("white"))
                                .cornerRadius(20)
                        }
                    }
                    VStack{ //VSTACK: Tagret and Total Tags
                        Text("🎯 YAMAN HABIP") //Target
                            .fixedSize()
                            .multilineTextAlignment(.center)
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(Color("lightGrey"))
                            .cornerRadius(20)
                        
                        Text("#️⃣ 5 tags") //Tags
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(Color("lightGrey"))
                            .cornerRadius(20)
                    }
                }
            }
            .listRowBackground(Color("darkGrey"))
            .padding()
            
            Section(){ //SECTION: Tag Out
                VStack{
                    VStack(alignment: .leading){ //Custom Section Label
                        Label("Tag Out", systemImage: "xmark.seal.fill")
                            .foregroundColor(Color("lightGrey"))
                    }
                    .padding(.bottom, 8)
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    TagButton() //Special View for Tag Out Button
                        .padding()
                }
            }
            .listRowBackground(Color("darkGrey"))
            .padding()
        }
        .onAppear(){
            UITableView.appearance().backgroundColor = UIColor(Color("offBlack")) //change View Backgrounnd
        }
    }
}

//Specialized Tag Out Button
struct TagButton: View {
    
    @State private var pressing: Bool = false
    @State var progress: CGFloat = 0.0
    @State var circleProgress: CGFloat = 0.0
    
    @State private var isOut = false
    @State private var isDetectingLongPress = false
    
    var body: some View {
            VStack {  // VSTACK: Button and Tagginng Out Texts
                ZStack {  // Button Back and the Spining Button
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    Circle()  // Background circle
                        .foregroundColor(Color("offGrey"))
                    Circle()  // Surrounding circle trimline: moves from 0 position to 100
                        .trim(from: 0.0, to: circleProgress)
                        .stroke(Color("salmon"), lineWidth: 5)
                        .frame(width: 150-15*2, height: 150-15*2)  // Slightly larger than prev. circle
                        .rotationEffect(Angle(degrees: -90))
                    
                    Image(systemName: isOut ? "checkmark.seal.fill" : "xmark.seal.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(isDetectingLongPress ? Color("salmon") : Color("lightGrey"))
                        .rotationEffect(.degrees(isDetectingLongPress ? 360 : 0))
                        .animation(isDetectingLongPress ?
                                   Animation.easeInOut(duration: 1.5)
                                        .repeatCount(2, autoreverses: true) : nil)
                                .onLongPressGesture(minimumDuration: 3.0, maximumDistance: 100 ,pressing: { (isPressing) in
                                    self.isDetectingLongPress = isPressing
                                }, perform: {
                                    impactMed.impactOccurred()
                                    isOut.toggle() //TAG OUT = TRUE
                                    self.startLoading()
                                    print("DONE")
                                })
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 10)
                
                Text(isDetectingLongPress ? "TAGGING OUT" : "") //IF PRESSING BUTTON: Display Text
                    .font(.title3)
                    .foregroundColor(Color("white"))
                    .glowBorder(color: Color("darkRed"), lineWidth: 5)
                
                Text(isOut ? "You have tagged out" : "") //IF TAGGED OUT: Display Text
                    .font(.title3)
                    .foregroundColor(Color("white"))
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

//Preview Provider
//struct ProfileView_Previews: PreviewProvider {
////    @StateObject var model = UserAuthModel()
//    static var previews: some View {
//        ProfileView()
//            .preferredColorScheme(.dark)
//            .previewInterfaceOrientation(.portrait)
//    }
//}
