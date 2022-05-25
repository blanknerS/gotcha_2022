//
//  CountdownView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/21/22.
//

import SwiftUI
import MessageUI

struct CountdownView: View {
    
    @State var nowDate: Date = Date()

     @State private var showMailView = false
    @State var showPopUp = false
    @State var user : String
    
//    var referenceDate: Date(2022-09-10 08:00:00 +0000) //This has to be Gotcha Day... GRRRRRRR not sure how to do
    var referenceDate: Date
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        
        VStack (spacing: 10){
            Spacer(minLength: 30)
            Text("WELCOME \(user)" .uppercased())
                .glowBorder(color: .black, lineWidth: 5)
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .padding(.bottom, 10)
            VStack{
                GifImageView(name: "anonymous-glitch")
        //                .scaledToFit()
        //                .layoutPriority(1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .cornerRadius(20)
                    .padding()
            }
//                .padding(.bottom, 10)
            Spacer(minLength: 30)
            Text("GOTCHA IN")
                .glowBorder(color: .black, lineWidth: 5)
                .foregroundColor(Color("white"))
                .font(.title)
//                .padding(.top, 80)
            
            HStack{
                let result = countDownString()
                BounceAnimationView(text: result.0, startTime: 0.0)
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
//            .background(Color.black)
            .cornerRadius(20)
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .offset(y:10)
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
            Spacer()
            ZStack{
                Button("Report Problem"){
                    showPopUp.toggle()
                    print("Clicked")
                }
    //            .offset(y:60)
                .padding(8)
                .background(Color("mediumGrey"))
                .foregroundColor(Color("lightGrey"))
    //            .glowBorder(color: .black, lineWidth: 2)
                .cornerRadius(20)
                .opacity(showPopUp ? 0 : 1)
                
                Color.clear
                    .modifier(Popup(isPresented: showPopUp,
                                    content: { ReportError(showPopUp: $showPopUp) }))
//                    .frame(width: 200, height: 130, alignment: .center)
//                    .background(Color.black)
            }
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
        let days = String(format: "%02d", components.day ?? 00)
        let hours = String(format: "%02d", components.hour ?? 00)
        let minutes = String(format: "%02d", components.minute ?? 00)
        let seconds = String(format: "%02d", components.second ?? 00)
        
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
        CountdownView(user: "Blake", referenceDate: Date()) //NOT SURE HOW TO GET DATE TIME OBJECT OF FUTURE DATE...
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
