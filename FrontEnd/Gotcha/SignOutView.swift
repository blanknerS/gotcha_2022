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
            Spacer()
            ZStack{
                GifImageView(name: "death-gif")
                    .frame(width: 480, height: 360)
                    .scaledToFill()
                    .onTapGesture {
                        model_passed.signOut()
                        print("Signed out -- inside button (SignOutView)")
                    }
            }
            .frame(width: 200, height: 200, alignment: .center)
            .clipShape(Circle())
            .padding()
            .cornerRadius(UsefulValues.cornerRadius)
            
            .padding(.bottom, 5)
            Text("Sign Out")
                .foregroundColor(Color("titleGrey"))
                .font(.title)
                .padding()
            
            Spacer()
            
//            Help Buttons
            
//            HStack{
//                Spacer()
//                Link(destination: URL(string: "mailto:gotchaatmilton@gmail.com?bcc=blake_ankner23@milton.edu,andrew_rodriguez23@milton.edu,yaman_habip23@milton.edu")!) {
//                    HStack{
//                        Image(systemName: "iphone.slash")
//                        Text("-- I.T. Help")
//                    }
//                    .padding(10)
//                    .foregroundColor(Color("titleGrey"))
//                    .background(Color("offGrey"))
//                    .frame(width: .infinity, height: .infinity, alignment: .bottom)
//                    .cornerRadius(UsefulValues.cornerRadius)
//                    .font(.title3)
//                }
//                Spacer()
//    //            SGA SUPPORT
//                Link(destination: URL(string: "mailto:robin_storey23@milton.edu,victor_chen23@milton.edu")!) {
//                    HStack{
//                        Image(systemName: "exclamationmark.shield.fill")
//                        Text("-- SGA Help")
//                    }
//                    .padding(10)
//                    .foregroundColor(Color("titleGrey"))
//                    .background(Color("offGrey"))
//                    .frame(width: .infinity, height: .infinity, alignment: .bottom)
//                    .cornerRadius(UsefulValues.cornerRadius)
//                    .font(.title3)
//                }
//                Spacer()
//            }
//            .padding()
//            .opacity(0.3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("darkestGrey"))
    }
}

struct signOut_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView(model_passed: UserAuthModel())
    }
}

//struct Previews_SignOutView_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack{
//
//            /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//
//        }
//    }
//}
