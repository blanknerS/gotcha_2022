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
                .foregroundColor(Color("titleGrey"))
                .font(.title)
                .padding()
            Divider().frame(maxWidth: 200, maxHeight:30)
                .foregroundColor(Color("lightGrey"))
//            IT SUPPORT
            Link(destination: URL(string: "mailto:gotchaatmilton@gmail.com?bcc=blake_ankner23@milton.edu,andrew_rodriguez23@milton.edu,yaman_habip23@milton.edu")!) {
                HStack{
                    Image(systemName: "iphone.slash")
                    Text("-- I.T. Help")
                }
                .padding(10)
                .foregroundColor(Color("titleGrey"))
                .background(Color("offGrey"))
                .frame(width: .infinity, height: .infinity, alignment: .bottom)
                .cornerRadius(5)
                .font(.title3)
            }
//            SGA SUPPORT
            Link(destination: URL(string: "mailto:robin_storey23@milton.edu,victor_chen23@milton.edu")!) {
                HStack{
                    Image(systemName: "exclamationmark.shield.fill")
                    Text("-- SGA Help")
                }
                .padding(10)
                .foregroundColor(Color("titleGrey"))
                .background(Color("offGrey"))
                .frame(width: .infinity, height: .infinity, alignment: .bottom)
                .cornerRadius(5)
                .font(.title3)
            }
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

struct Previews_SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            
            /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
            
        }
    }
}
