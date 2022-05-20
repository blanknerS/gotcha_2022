//
//  ProfileView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/19/22.
//

import SwiftUI

struct ProfileView: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color("violet"), Color("yellow")],
        startPoint: .top, endPoint: .bottom)
    
    
    var body: some View {
        VStack (alignment: .center, spacing: 20){
            HStack{
                Text("Name")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .background(Color("rose"))
                    .cornerRadius(20)
                Spacer()
                Label("Leaderboard", systemImage: "crown.fill")
                    .font(.title2)
                    .foregroundColor(Color("lavender"))
            }
            Spacer()
            Label("Your Target: _______", systemImage: "exclamationmark.shield.fill")
                .font(.title2)
                .foregroundColor(Color.black)
                .background(Color("acid"))
                .cornerRadius(20)
//                .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color("acid"), lineWidth: 5)
//                        )
                
            Label("Number of Tags: _______", systemImage: "number")
                .font(.title2)
                .foregroundColor(Color.black)
                .background(Color("rose"))
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
    }
}
