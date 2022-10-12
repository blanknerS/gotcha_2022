//
//  loading.swift
//  Gotcha
//
//  Created by Blake Ankner on 7/12/22.
//

import SwiftUI

struct LoadingView: View {
        var body: some View {
            VStack{
                slideCircle()
                Spacer()
                    .frame(height: 50)
                Text("Loading...")
                    .font(.title)
                    .foregroundColor(Color("lightGrey"))
            }
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color("darkestGrey"))
        }
}

struct slideCircle: View{
    let timer = Timer.publish(every: 0.9, on: .main, in: .common).autoconnect()
        @State var leftOffset: CGFloat = -100
        @State var rightOffset: CGFloat = 100
        
        var body: some View {
            ZStack {
                Circle()
                    .fill(Color("mediumGrey"))
                    .frame(width: 25, height: 25)
                    .offset(x: leftOffset)
                    .opacity(0.7)
                    .animation(Animation.easeInOut(duration: 1))
                Circle()
                    .fill(Color("offGrey"))
                    .frame(width: 25, height: 25)
                    .offset(x: leftOffset)
                    .opacity(0.7)
                    .animation(Animation.easeInOut(duration: 1).delay(0.2))
                Circle()
                    .fill(Color("darkestGrey"))
                    .frame(width: 25, height: 25)
                    .offset(x: leftOffset)
                    .opacity(0.7)
                    .animation(Animation.easeInOut(duration: 1).delay(0.4))
                Circle()
                    .fill(Color("offBlack"))
                    .frame(width: 25, height: 25)
                    .offset(x: leftOffset)
                    .opacity(0.7)
                    .animation(Animation.easeInOut(duration: 1).delay(0.6))
                Circle()
                    .fill(Color("black"))
                    .frame(width: 25, height: 25)
                    .offset(x: leftOffset)
                    .opacity(0.7)
                    .animation(Animation.easeInOut(duration: 1).delay(0.8))
            }
            .onReceive(timer) { (_) in
                swap(&self.leftOffset, &self.rightOffset)
            }
        }
}

struct loading_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
