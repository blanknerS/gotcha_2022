//
//  LeaderBoardView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/12/22.
//

import SwiftUI
import FirebaseFirestore

struct LeaderBoardView: View {
    
    init() { //settinig the List Background upon Init (no different thann the Profile .onAppear version)
        UITableView.appearance().backgroundColor = UIColor(Color("offBlack"))
    }
    
    struct Leader: Identifiable, Codable{ //setup Leader object
        
        let name: String
        let tags: Int
        let pos: Int
        let id = UUID()
    }
    
    public struct Words: Identifiable, Codable{ //setup Word object
        let sentence: String
        let id = UUID()
        let author: String
    }
        
//    var leaders: [Leader] = [ //make list of Leader Objects
//        Leader(name: "Player3", tags: "3", pos: "4"),
//        Leader(name: "Player4", tags: "4", pos: "5"),
//        Leader(name: "Player5", tags: "3", pos: "6"),
//        Leader(name: "Player6", tags: "3", pos: "7"),
//        Leader(name: "Player7", tags: "3", pos: "8"),
//        Leader(name: "Player8", tags: "3", pos: "9"),
//
//    ]

    @State private var lastWords: [Words] = []
    @State private var leaders: [Leader] = [
        Leader(name: " ", tags: 0, pos: 1),
        Leader(name: " ", tags: 0, pos: 2),
        Leader(name: " ", tags: 0, pos: 3),
        Leader(name: " ", tags: 0, pos: 4),
        Leader(name: " ", tags: 0, pos: 5),
        Leader(name: " ", tags: 0, pos: 6),
        Leader(name: " ", tags: 0, pos: 7),
        Leader(name: " ", tags: 0, pos: 8),
        Leader(name: " ", tags: 0, pos: 9),
        Leader(name: " ", tags: 0, pos: 10),
    ]
    
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
                
                ScrollView{
                    HStack{ //first place
                        Text("1st") //name
                            .foregroundColor(Color("gold"))
                        Spacer()
                        Text(leaders[0].name) //name
                            .foregroundColor(Color("gold"))
                        Spacer()
                        Label("\(leaders[0].tags)", systemImage: "checkmark.shield.fill") //tags
                            .foregroundColor(Color("gold"))
                    }
                    .frame(height: 40)
                    Divider()
                    HStack{ //second place
                        Text("2nd")
                            .foregroundColor(Color("silver"))
                        Spacer()
                        Text(leaders[1].name)
                            .foregroundColor(Color("silver"))
                        Spacer()
                        Label("\(leaders[1].tags)", systemImage: "checkmark.shield.fill")
                            .foregroundColor(Color("silver"))
                    }
                    .frame(height: 40)
                    Divider()
                    HStack{ //third place
                        Text("3rd")
                            .foregroundColor(Color("bronze"))
                        Spacer()
                        Text(leaders[2].name)
                            .foregroundColor(Color("bronze"))
                        Spacer()
                        Label("\(leaders[2].tags)", systemImage: "checkmark.shield.fill")
                            .foregroundColor(Color("bronze"))
                    }
                    .frame(height: 40)
                    Divider()
                    ForEach(3..<10) { i in //rest of players on leaderboard
                        HStack{
                            Text("\(i+1)th")
                                .foregroundColor(Color("mediumGrey"))
                            Spacer()
                            Text(self.leaders[i].name) //name
                                .foregroundColor(Color("mediumGrey"))
                            Spacer()
                            Label("\(self.leaders[i].tags)", systemImage: "checkmark.shield.fill") //tags
                                .foregroundColor(Color("mediumGrey"))
                        }
                        .frame(height: 30)
                        Divider()
                    }
                }
                .frame(height: 180)
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
                .frame(height: 180)
            }
            .listRowBackground(Color("darkGrey"))
        }
        .onAppear{
            Task{
                readLastWords()
                pullLeaderboard()
            }
        }
        .refreshable {
            readLastWords()
            pullLeaderboard()
        }
    }
    
    func readLastWords(){
        let db = Firestore.firestore()
        db.collection("lastWords").getDocuments() { (querySnapshot, err) in
            var allWords: [Words] = []
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
//                    print(document.data())
                    
                    let lastWords = document.get("Lw")
                    let author = document.get("Author")
                    
                    allWords.append(Words(sentence: lastWords as! String, author: author as! String))
                }
            }
            self.didFetchData(data: allWords)
        }
    }

    func didFetchData(data: [Words]){
        lastWords = data
        //Do what you want
    }
    
    func pullLeaderboard(){
        let db = Firestore.firestore()
        
        db.collection("data").order(by: "tags", descending: true).limit(to: 10).getDocuments() { (querySnapshot, err) in
            var allBoard: [Leader] = []
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let firstName = document.get("firstName")
                    let lastName = document.get("lastName")
                    let name = (firstName as? String ?? "") + " " + (lastName as? String ?? "")
                    let tags = document.get("tags") as? Int ?? 0
                    
                    allBoard.append(Leader(name: name, tags: tags as! Int, pos: tags as! Int))
                }
            }
            self.didFetchData2(data: allBoard)
        }
    }
    func didFetchData2(data: [Leader]){
        print("called")
//        print(data)
        leaders = data
        //Do what you want
    }
}

//Preview Provider
struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
            .preferredColorScheme(.dark)
    }
}
