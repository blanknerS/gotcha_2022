//
//  ProfileView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/19/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 20){
            HStack{
                Text("Name")
                    .font(.largeTitle)
                    .foregroundColor(Color("bubblegum"))
                Spacer()
                Label("Leaderboard", systemImage: "crown.fill")
                    .font(.title2)
                    .foregroundColor(Color("lavender"))
            }
            Spacer()
            Label("Your Target: _______", systemImage: "exclamationmark.shield.fill")
                .font(.title2)
                .foregroundColor(Color("acid"))
                
            Label("Number of Tags: _______", systemImage: "number")
                .font(.title2)
                .foregroundColor(Color("rose"))
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
        .background(Color("bahama_beach"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
