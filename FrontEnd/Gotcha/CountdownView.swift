//
//  CountdownView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/21/22.
//

import SwiftUI
import MessageUI

struct CountdownView: View {
    
    @State var nowDate: Date = Date() //Current Date that updates with screen
    @State var user : String //User name inherited from View call
    
    var referenceDate: Date //gotcha date referenced later
    var timer: Timer { //Make a one second timer
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        VStack (spacing: 10){
            Text("WELCOME  \(user)".uppercased()) //Text of User Name
                .glowBorder(color: .black, lineWidth: 5) //glowBorder is a swift file that adds unnique styling
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .padding(.bottom, 10)
                .offset(y: -20) //move welcome up screen by 40
            
            GifImageView(name: "anonymous-glitch") //Special WebView that displays GIF
                .layoutPriority(1)
                .frame(maxWidth: .infinity, maxHeight: 260)
                .background(Color.black)
                .cornerRadius(20)
                .padding()

            Text("GOTCHA IN") //Text
                .glowBorder(color: .black, lineWidth: 5)
                .foregroundColor(Color("white"))
                .font(.title)
                .offset(y: 10)
            
            HStack{ //Countdown Clock Stack
                let result = countDownString() //call function that gets time until gotcha
                BounceAnimationView(text: result.0, startTime: 0.0) //Bounce animation is a special swift file styliing
                    .padding()
                    .background(Color("darkGrey"))
                    .glowBorder(color: .red, lineWidth: 10)
                    .cornerRadius(20)
                BounceAnimationView(text: result.1, startTime: 1.5)
                    .padding()
                    .background(Color("darkGrey"))
                    .glowBorder(color: .red, lineWidth: 10)
                    .cornerRadius(20)
                BounceAnimationView(text: result.2, startTime: 3.0)
                    .padding()
                    .background(Color("darkGrey"))
                    .glowBorder(color: .red, lineWidth: 10)
                    .cornerRadius(20)
                BounceAnimationView(text: result.3, startTime: 4.5)
                    .padding()
                    .background(Color("darkGrey"))
                    .glowBorder(color: .red, lineWidth: 10)
                    .cornerRadius(20)
            
            }
            .frame(maxWidth: .infinity, maxHeight: 70)
            .cornerRadius(20)
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .offset(y:20)
            .onAppear(perform: {
                _ = self.timer
            })
            HStack{
                Text("Days")
                Text("Hours")
                Text("Min")
                Text("Sec")
            }
            .padding()
            .foregroundColor(Color("darkGrey"))
            .offset(y: 10)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("lightGrey"))
    }
    
    func countDownString() -> (String, String, String, String) { //counttdown function
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"

        let myDate = dateFormatter.date(from: "2022-09-10T10:00")!
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: myDate)
        let days = String(format: "%02d", components.day ?? 00)
        let hours = String(format: "%02d", components.hour ?? 00)
        let minutes = String(format: "%02d", components.minute ?? 00)
        let seconds = String(format: "%02d", components.second ?? 00)
        
        return (days, hours, minutes, seconds)
    }
}

//Bounce Animation View
struct BounceAnimationView: View {
    let characters: Array<String.Element>
    
    @State var offsetYForBounce: CGFloat = -50
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    
    init(text: String, startTime: Double){
        self.characters = Array(text)
        self.baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .offset(x: 0.0, y: offsetYForBounce)
                    .opacity(opacity)
                    .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.1).delay( Double(num) * 0.2 ), value: offsetYForBounce)
            }
            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                    opacity = 0
                    offsetYForBounce = -50
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    opacity = 1
                    offsetYForBounce = 0
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                    opacity = 1
                    offsetYForBounce = 0
                }
            }
        }
    }
}

//PREVIEW PROVIDER
struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(user: "Blake", referenceDate: Date())
    }
}


