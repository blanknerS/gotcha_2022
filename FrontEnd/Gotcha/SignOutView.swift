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
            Button(action: {
                model_passed.signOut()
            }) {
                Text("Sign Out")
            }
        }
        .padding()
    }
}

//struct signOut_Previews: PreviewProvider {
//    static var previews: some View {
//        signOut()
//    }
//}
