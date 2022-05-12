//
//  MainView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Name")
                    .font(.headline)
                Spacer()
                Label("Leaderboard", systemImage: "crown.fill")
            }
            Spacer()
            Spacer()
            Text("Your Target: ______")
            Text("Number of Tages: ______")
            Circle()
            Text("Tag out")
            
        }
        .navigationTitle("Main Page")
        .padding(4)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
