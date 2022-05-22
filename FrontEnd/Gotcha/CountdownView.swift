//
//  CountdownView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/21/22.
//

import SwiftUI

struct CountdownView: View {
    
    @State var nowDate: Date = Date()
    
    
    
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
                Text(result.0)
                    .background(Color.red)
                Text(result.1)
                Text(result.2)
                Text(result.3)
            
            }
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .onAppear(perform: {
                _ = self.timer
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
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
