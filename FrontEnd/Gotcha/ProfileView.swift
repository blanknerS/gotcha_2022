//
//  ProfileView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/19/22.
//

import SwiftUI

struct ProfileView: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color("lightBlue"), Color("secondBlue")],
        startPoint: .top, endPoint: .bottom)
    
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text("Blake")
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color("white"))
                    .background(Color("firstBlue"))
                    .cornerRadius(20)
                Spacer()
            }
            Image("blakeProfile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 150, height: 150)
            
            Spacer()
            Label("Your Target: YAMAN HABIP", systemImage: "exclamationmark.shield.fill")
                .multilineTextAlignment(.center)
                .padding()
                .font(.title2)
                .foregroundColor(Color("white"))
                .background(Color("mediumRed"))
                .cornerRadius(20)
//                .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color("acid"), lineWidth: 5)
//                        )
                
            Label("Number of Tags: 5", systemImage: "number")
                .font(.title2)
                .padding()
                .foregroundColor(Color("white"))
                .background(Color("darkGreen"))
                .cornerRadius(20)
            Spacer()
//            ScrollView{
//                VStack{
//                    ForEach(0..<100) {
//                                    Text("Row \($0)")
//                                }
//                    }
//            }
//            .padding(10).border(Color.red, width: 3)
//            .frame(width: .infinity, height: 100)
//
        }
        .padding()
        .background(backgroundGradient)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
