//
//  BottomPopupView.swift
//  Gotcha
//
//  Created by Blake Ankner on 7/19/22.
//

import SwiftUI

struct BottomPopupView<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                content
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
//                    .background(Color.white)
//                    .cornerRadius(10)
                    .frame(width: geometry.size.width+10, height: geometry.size.height)
                    .offset(x: -5)
            }
            .edgesIgnoringSafeArea([.bottom])
        }
        .animation(.easeOut)
        .transition(.move(edge: .bottom))
    }
}
