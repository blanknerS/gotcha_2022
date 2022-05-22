//
//  CountdownView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/21/22.
//

import SwiftUI

struct CountdownView: View {
    
    @State var nowDate: Date = Date()
    @State var flipped = false
    
//    var referenceDate: Date(2022-09-10 08:00:00 +0000) //This has to be Gotcha Day... GRRRRRRR not sure how to do
    var referenceDate: Date
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        
        VStack{
            GifImageView(name: "anonymous-glitch")
                .frame(maxWidth: .infinity, maxHeight: 250)
                .background(Color.black)
                .cornerRadius(20)
                .padding()
            HStack{
                let result = countDownString()
                BounceAnimationView(text: result.0, startTime: 0.0)
                    .padding()
                    .background(Color("darkGrey"))
                    .cornerRadius(20)
//                Text(result.0)
//                    .padding()
//                    .background(Color("darkGrey"))
//                    .cornerRadius(20)
                BounceAnimationView(text: result.1, startTime: 1.5)
                    .padding()
                    .background(Color("darkGrey"))
                    .cornerRadius(20)
                BounceAnimationView(text: result.2, startTime: 3.0)
                    .padding()
                    .background(Color("darkGrey"))
                    .cornerRadius(20)
                BounceAnimationView(text: result.3, startTime: 4.5)
                    .padding()
                    .background(Color("darkGrey"))
                    .cornerRadius(20)
            
            }
            .background(Color.black)
            .cornerRadius(20)
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .onAppear(perform: {
                _ = self.timer
            })
            
//            BounceAnimationView(text: "枯菊や日日にさめゆくいきどほり", startTime: 0.0)
//            BounceAnimationView(text: "萩原朔太郎", startTime: 1.5)
                .padding(.top, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("lightGrey"))
    }
    func countDownString() -> (String, String, String, String) {
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"

        let myDate = dateFormatter.date(from: "2022-09-10T10:00")!
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: myDate)
        let days = String(format: "%02dd", components.day ?? 00)
        let hours = String(format: "%02dh", components.hour ?? 00)
        let minutes = String(format: "%02dm", components.minute ?? 00)
        let seconds = String(format: "%02ds", components.second ?? 00)
        
        flipped.toggle()
        print(flipped)
        
        return (days, hours, minutes, seconds)
//        return String(format: "%02dd:%02dh:%02dm:%02ds",
//                      components.day ?? 00,
//                      components.hour ?? 00,
//                      components.minute ?? 00,
//                      components.second ?? 00)
    }
}




struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(referenceDate: Date()) //NOT SURE HOW TO GET DATE TIME OBJECT OF FUTURE DATE...
    }
}

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
//                    .font(fixedSize: 24)
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
