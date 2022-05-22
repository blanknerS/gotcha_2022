//
//  clock.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/21/22.
//

import SwiftUI

struct clock: View {
    
    //MARK: - PROPERTIES
        @State var timeRemaining = 24*60*60
        
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
    //MARK: - BODY
    var body: some View {
        VStack{
            Text("\(timeString(time: timeRemaining))")
                .font(.system(size: 60))
                .frame(height: 80.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.black)
                .onReceive(timer){ _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    }else{
                        self.timer.upstream.connect().cancel()
                    }
                }
        }
    }
        
        //Convert the time into 24hr (24:00:00) format
        func timeString(time: Int) -> String {
            let hours   = Int(time) / 3600
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

struct clock_Previews: PreviewProvider {
    static var previews: some View {
        clock()
    }
}
