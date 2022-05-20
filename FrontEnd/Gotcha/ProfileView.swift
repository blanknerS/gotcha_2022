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
        VStack (alignment: .center, spacing: 20){
            HStack{
                Text("Name")
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color("white"))
                    .background(Color("firstBlue"))
                    .cornerRadius(20)
                Spacer()
            }
            Spacer()
            Label("Your Target: _______", systemImage: "exclamationmark.shield.fill")
                .padding()
                .font(.title2)
                .foregroundColor(Color("white"))
                .background(Color("firstBlue"))
                .cornerRadius(20)
//                .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color("acid"), lineWidth: 5)
//                        )
                
            Label("Number of Tags: _______", systemImage: "number")
                .font(.title2)
                .padding()
                .foregroundColor(Color("white"))
                .background(Color("firstBlue"))
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
