//
//  CountdownView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/21/22.
//

import SwiftUI

struct CountdownView: View {
    
    @State var nowDate: Date = Date()
    
    
    
    var referenceDate: Date(2022-09-10 08:00:00 +0000) //This has to be Gotcha Day... GRRRRRRR not sure how to do
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
            Text(countDownString(from: referenceDate))
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .onAppear(perform: {
                    _ = self.timer
                })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
    func countDownString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: referenceDate)
        return String(format: "%02dd:%02dh:%02dm:%02ds",
                      components.day ?? 00,
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }
}




struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(referenceDate: Date()) //NOT SURE HOW TO GET DATE TIME OBJECT OF FUTURE DATE...
    }
}
