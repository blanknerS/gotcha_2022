//
//  LeaderBoardView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

import SwiftUI

struct LeaderBoardView: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color("lightBlue"), Color("secondBlue")],
        startPoint: .top, endPoint: .bottom)
    
    struct Leader: Identifiable{
        
        let name: String
        let tags: String
        let id = UUID()

    }
    
    struct Words: Identifiable{
        let sentence: String
        let id = UUID()
        let author: String
    }
    
    //populate this list with Leaders in the given format
    
    var leaders: [Leader] = [
        
        Leader(name: "Player1", tags: "1"),
        Leader(name: "Player2", tags: "2"),
        Leader(name: "Player3", tags: "3"),
        Leader(name: "Player4", tags: "4")
        
    ]
    
    var lastWords: [Words] = [
        Words(sentence: "BLEH BLEH ALW", author: "Blake"),
        Words(sentence: "BLEH jldvnle", author: "Yaman"),
        Words(sentence: "lwoiefnweflw", author: "Andrew"),
        Words(sentence: "BLFJh3oI", author: "Ryan"),
    ]
    
    @State private var ids = Set<UUID>()

    var body: some View {
        
//        UITableView.appearance().backgroundColor = .clear
//        UITableViewCell.appearance().backgroundColor = .clear
        
        List{
            Section(header: Text("LeaderBoard")){
                ForEach(leaders) { leader in
                    HStack{
                        Text(leader.name)
                            .foregroundColor(Color("black"))
                        Spacer()
                        Label(leader.tags, systemImage: "checkmark.shield.fill")
                            .foregroundColor(Color("darkGrey"))
                    }
                }
                .listRowBackground(Color("white"))
            }
            Section(header: Text("Last Words")){
                ForEach(lastWords) { word in
                    HStack{
                        Text(word.sentence)
                        Spacer()
                        Text("- \(word.author)")
                    }
                }
                .listRowBackground(Color("darkGrey"))
            }
        }
        
        .navigationTitle("Leader Board")
        .padding()
        .background(backgroundGradient.ignoresSafeArea())
        .onAppear {
            // Set the default to clear
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

        


struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
            .preferredColorScheme(.dark)
    }
}
