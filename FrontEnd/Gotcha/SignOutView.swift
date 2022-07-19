//
//  signOut.swift
//  Gotcha
//
//  Created by Blake Ankner on 7/13/22.
//

import SwiftUI

struct SignOutView: View {
    
    let model_passed: UserAuthModel
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(Color("offGrey"))
                    .frame(maxWidth: 220, maxHeight:220)
                    .scaledToFit()
                Button(action: { //OAUTH STUFF @Tommy haha
                    model_passed.signOut()}, label: {Image(systemName: "peacesign")
                       .resizable()
                       .foregroundColor(Color("titleGrey"))
                       .frame(maxWidth: 200, maxHeight:200)
                       .scaledToFit()})
            }
            .padding(.bottom, 5)
            Text("Sign Out")
                .foregroundColor(Color("lightGrey"))
                .font(.title)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("darkGrey"))
    }
}

//struct signOut_Previews: PreviewProvider {
//    static var previews: some View {
//        SignOutView()
//    }
//}
