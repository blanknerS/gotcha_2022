//
//  TagOutView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

import SwiftUI

struct TagOutView: View {
    
//    @Binding var show: Bool
    let backgroundGradient = LinearGradient(
        colors: [Color("lightBlue"), Color("secondBlue")],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        VStack{
        }
        .padding()
        .background(backgroundGradient)
    }
}

struct TagOutView_Previews: PreviewProvider {
    static var previews: some View {
        TagOutView()
            .preferredColorScheme(.dark)
    }
}
