//
//  CountdownView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/21/22.
//

import SwiftUI
import MessageUI
import AVKit


struct CountdownView: View {
    
    @State var nowDate: Date = Date() //Current Date that updates with screen
    @State var user : String //User name inherited from View call
    
    @Binding var dDay: Bool
    
    @State var audioPlayer: AVAudioPlayer!
    
    var referenceDate: Date //gotcha date referenced later
    var timer: Timer { //Make a one second timer
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
            self.dDay = countDownString().4
            if !self.audioPlayer.isPlaying && !self.dDay{
                self.audioPlayer.play()
            }
            if self.dDay{
                self.audioPlayer.stop()
            }
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
                // I HAVE THE DDAY ON RESULT.5 ! I NOW NEED TO PASS THAT TO THE DDAY VAR SOMEHOW....
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
                let sound = Bundle.main.path(forResource: "clock-ticking-audio", ofType: "mp3")
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                } catch(let error) {
                    print(error.localizedDescription)
                }
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
    
    func countDownString() -> (String, String, String, String, Bool) { //counttdown function
        
        var gotchaDay: Bool = false
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"

//        let myDate = dateFormatter.date(from: "2022-09-10T10:00")!
        let myDate = dateFormatter.date(from: "2022-07-22T00:36")! //TESTING DATE!!!!
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: myDate)
//        converting optional(int) to int
        let int_day = Int(components.day ?? 00)
        let int_hour = Int(components.hour ?? 00)
        let int_minute = Int(components.minute ?? 00)
        let int_second = Int(components.second ?? 00)

//        print("day: \(int_day) || hour: \(int_hour) || minute: \(int_minute) || tenMin: \(self.tenMinutes)") //BUG TESTER!
        
        
        if int_day == 1 && int_second == 0{
            print("T-One Day") //add notification trigger here
        }
        if int_day == 0 && int_hour == 1 && int_second == 0{
            print("T-One Hour") //add notification trigger here
        }
        if int_day == 0 && int_hour == 0 && int_minute == 10 && int_second == 0{
            print("T-10 Minutes") //add notification trigger here
        }
        if int_day <= 0 && int_hour <= 0 && int_minute <= 0 && int_second <= 0{
            gotchaDay = true
            UserDefaults.standard.set(true, forKey: "game_on")
//            print("gotcha_time: \(gotchaDay)")
        }
        
        let days = String(format: "%02d", components.day ?? 00)
        let hours = String(format: "%02d", components.hour ?? 00)
        let minutes = String(format: "%02d", components.minute ?? 00)
        let seconds = String(format: "%02d", components.second ?? 00)
        
        return (days, hours, minutes, seconds, gotchaDay)
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

////PREVIEW PROVIDER
//struct CountdownView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountdownView(user: "Blake", referenceDate: Date())
//    }
//}


