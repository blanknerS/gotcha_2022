//
//  LeaderBoardView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

import SwiftUI

struct LeaderBoardView: View {
    
    init() { //settinig the List Background upon Init (no different thann the Profile .onAppear version)
        UITableView.appearance().backgroundColor = UIColor(Color("offBlack"))
    }
    
    struct Leader: Identifiable{ //setup Leader object
        
        let name: String
        let tags: String
        let pos: String
        let id = UUID()
    }
    
    struct Words: Identifiable{ //setup Word object
        let sentence: String
        let id = UUID()
        let author: String
    }
        
    var leaders: [Leader] = [ //make list of Leader Objects
        Leader(name: "Player3", tags: "3", pos: "4"),
        Leader(name: "Player4", tags: "4", pos: "5"),
        Leader(name: "Player5", tags: "3", pos: "6"),
        Leader(name: "Player6", tags: "3", pos: "7"),
        Leader(name: "Player7", tags: "3", pos: "8"),
        Leader(name: "Player8", tags: "3", pos: "9"),
        
    ]
    
    var lastWords: [Words] = [ //make list of Word Objects
        Words(sentence: "BLEH BLEH ALW", author: "Blake"),
        Words(sentence: "BLEH jldvnle", author: "Yaman"),
        Words(sentence: "lwoiefnweflw", author: "Andrew"),
        Words(sentence: "BLFJh3oI", author: "Ryan"),
    ]
    
    @State private var ids = Set<UUID>()
    
    var body: some View {
        List{
            Section(){ //LEADER BOARD
                VStack(alignment: .leading){ //cutsom section header
                    Label("Leaderboard", systemImage: "list.number")
                        .foregroundColor(Color("titleGrey"))
                }
                .padding(.top)
                .padding(.bottom, 5)
                .listRowSeparator(.hidden)
                
                HStack{ //HSTACK: Centering the trophy images
                    Spacer()
                    Image("trophies")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 250, maxHeight: 100)
                        .padding(.top, 8)
                    Spacer()
                }
                .padding(.bottom)
                
                HStack{ //first place
                    Text("1st") //name
                        .foregroundColor(Color("gold"))
                    Spacer()
                    Text("Blake") //name
                        .foregroundColor(Color("gold"))
                    Spacer()
                    Label("33", systemImage: "checkmark.shield.fill") //tags
                        .foregroundColor(Color("gold"))
                }
                HStack{ //second place
                    Text("2nd")
                        .foregroundColor(Color("silver"))
                    Spacer()
                    Text("Yaman")
                        .foregroundColor(Color("silver"))
                    Spacer()
                    Label("22", systemImage: "checkmark.shield.fill")
                        .foregroundColor(Color("silver"))
                }
                HStack{ //third place
                    Text("3rd")
                        .foregroundColor(Color("bronze"))
                    Spacer()
                    Text("Andrew")
                        .foregroundColor(Color("bronze"))
                    Spacer()
                    Label("10", systemImage: "checkmark.shield.fill")
                        .foregroundColor(Color("bronze"))
                }
                ScrollView{
                    ForEach(leaders) { leader in //rest of players on leaderboard
                        HStack{
                            Text("\(leader.pos)th")
                                .foregroundColor(Color("mediumGrey"))
                            Spacer()
                            Text(leader.name) //name
                                .foregroundColor(Color("mediumGrey"))
                            Spacer()
                            Label(leader.tags, systemImage: "checkmark.shield.fill") //tags
                                .foregroundColor(Color("mediumGrey"))
                        }
                        .frame(height: 30)
                        Divider()
                    }
                }
                .frame(height: 125)
            }
            .listRowBackground(Color("darkGrey"))
            
            Section(){ // LAST WORDS
                VStack(alignment: .leading){
                    Label("Last Words", systemImage: "highlighter")
                        .foregroundColor(Color("titleGrey"))
                }
                .listRowSeparator(.hidden)
                .padding(.top)
                .padding(.bottom, 5)
                ScrollView{
                    ForEach(lastWords) { word in //ALL Last Words !! Only want to show like 5 here!!
                        HStack{
                            Text(word.sentence)
                            Spacer()
                            Text("- \(word.author)")
                        }
                        .foregroundColor(Color("lightGrey"))
                        .frame(height: 40)
                        Divider()
                    }
                }
                .frame(height: 200)
            }
            .listRowBackground(Color("darkGrey"))
        }
    }
}
        
//Preview Provider
struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
            .preferredColorScheme(.dark)
    }
}
