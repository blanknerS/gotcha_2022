//
//  LeaderBoardView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

import SwiftUI

struct LeaderBoardView: View {
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("offBlack"))
    }
    
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
        
    var leaders: [Leader] = [
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
        List{
            Section(){
                VStack(alignment: .leading){
                    Label("Leaderboard", systemImage: "list.number")
                        .foregroundColor(Color("lightGrey"))
                }
                .padding(.top)
                .padding(.bottom, 5)
                .listRowSeparator(.hidden)
                HStack{
                    Spacer()
                    Image("trophies")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 250, maxHeight: 100)
                        .padding(.top, 8)
                    Spacer()
                }
                .padding(.bottom)
                HStack{ //first
                    Text("Blake")
                        .foregroundColor(Color("gold"))
                    Spacer()
                    Label("33", systemImage: "checkmark.shield.fill")
                        .foregroundColor(Color("gold"))
                }
                HStack{ //second
                    Text("Yaman")
                        .foregroundColor(Color("silver"))
                    Spacer()
                    Label("22", systemImage: "checkmark.shield.fill")
                        .foregroundColor(Color("silver"))
                }
                HStack{ //third
                    Text("Andrew")
                        .foregroundColor(Color("bronze"))
                    Spacer()
                    Label("10", systemImage: "checkmark.shield.fill")
                        .foregroundColor(Color("bronze"))
                }
                
                ForEach(leaders) { leader in
                    HStack{
                        Text(leader.name)
                            .foregroundColor(Color("mediumGrey"))
                        Spacer()
                        Label(leader.tags, systemImage: "checkmark.shield.fill")
                            .foregroundColor(Color("mediumGrey"))
                    }
                }
            }
            .listRowBackground(Color("darkGrey"))
            
            Section(){
                VStack(alignment: .leading){
                    Label("Last Words", systemImage: "highlighter")
                        .foregroundColor(Color("lightGrey"))
                }
                .listRowSeparator(.hidden)
                .padding(.top)
                .padding(.bottom, 5)
                ForEach(lastWords) { word in
                    HStack{
                        Text(word.sentence)
                        Spacer()
                        Text("- \(word.author)")
                    }
                    .foregroundColor(Color("mediumGrey"))
                }
            }
            .listRowBackground(Color("darkGrey"))
        }
    }
}

        


struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
            .preferredColorScheme(.dark)
    }
}
