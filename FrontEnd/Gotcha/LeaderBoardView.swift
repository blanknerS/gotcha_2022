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

    @State private var lastWords: [Words] = [
        Words(sentence: "", author: ""),
        Words(sentence: "", author: ""),
        Words(sentence: "", author: ""),
    ]
    @State private var leaders: [Leader] = [
        Leader(name: "", tags: 0, pos: 1),
        Leader(name: "", tags: 0, pos: 2),
        Leader(name: "", tags: 0, pos: 3),
        Leader(name: " ", tags: 0, pos: 4),
        Leader(name: " ", tags: 0, pos: 5),
        Leader(name: " ", tags: 0, pos: 6),
        Leader(name: " ", tags: 0, pos: 7),
        Leader(name: " ", tags: 0, pos: 8),
        Leader(name: " ", tags: 0, pos: 9),
        Leader(name: " ", tags: 0, pos: 10),
    ]
    
    @State private var isPresented: Bool = false
    @State private var clickedSentence: String = ""
    @State private var clickedAuthor: String = ""
    
    var body: some View {
        List{
            HStack(){
                Text("Leaderboard")
                    .font(Font.title2.bold())
            }
            .listRowBackground(Color("darkGrey").opacity(0.0))
            VStack{
                Section(){ //LEADER BOARD
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
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            HStack{ //First Place
                                VStack{
                                    HStack{
                                        Text("1st")
                                            .font(.caption)
                                            .frame(width: .infinity, height: .infinity, alignment: .leading)
                                        Spacer()
                                    }
                                    ZStack{
                                        Circle()
                                            .foregroundColor(Color("offGold"))
                                            .frame(width: 65, height: 65)
                                        Text("\(leaders[0].tags)")
                                            .foregroundColor(Color("white"))
                                            .font(.system(size: 35, weight: .bold))

                                    }
                                    Text(leaders[0].name)
                                        .lineLimit(1)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .font(.footnote)
                                        .foregroundColor(Color("white"))
                                }
                            }
                            .padding()
                            .background(Color("gold"))
                            .cornerRadius(UsefulValues.cornerRadius)
                            .frame(width: 140, height: .infinity)
                            
                            HStack{ //Second Place
                                VStack{
                                    HStack{
                                        Text("2nd")
                                            .font(.caption)
                                            .frame(width: .infinity, height: .infinity, alignment: .leading)
                                        Spacer()
                                    }
                                    ZStack{
                                        Circle()
                                            .foregroundColor(Color("offGrey"))
                                            .frame(width: 65, height: 65)
                                        Text("\(leaders[1].tags)")
                                            .foregroundColor(Color("white"))
                                            .font(.system(size: 35, weight: .bold))

                                    }
                                    Text(leaders[1].name)
                                        .lineLimit(1)
                                        .multilineTextAlignment(.center)
                                        .font(.footnote)
                                        .foregroundColor(Color("white"))
                                }
                            }
                            .padding()
                            .background(Color("silver"))
                            .cornerRadius(UsefulValues.cornerRadius)
                            .frame(width: 140, height: .infinity)
                            
                            HStack{ //third place
                                VStack{
                                    HStack{
                                        Text("3rd")
                                            .font(.caption)
                                            .frame(width: .infinity, height: .infinity, alignment: .leading)
                                        Spacer()
                                    }
                                    ZStack{
                                        Circle()
                                            .foregroundColor(Color("brown"))
                                            .frame(width: 65, height: 65)
                                        Text("\(leaders[2].tags)")
                                            .foregroundColor(Color("white"))
                                            .font(.system(size: 35, weight: .bold))
                                    }
                                    Text(leaders[2].name)
                                        .lineLimit(1)
                                        .multilineTextAlignment(.center)
                                        .font(.footnote)
                                        .foregroundColor(Color("white"))
                                }
                            }
                            .padding()
                            .background(Color("bronze"))
                            .cornerRadius(UsefulValues.cornerRadius)
                            .frame(width: 140, height: .infinity)
                            
                            if leaders.count > 3{
                                ForEach(3..<leaders.count) { i in //rest of players on leaderboard
                                    HStack{
                                        VStack{
                                            HStack{
                                                Text("\(i+1)th")
                                                    .font(.caption)
                                                    .frame(width: .infinity, height: .infinity, alignment: .leading)
                                                Spacer()
                                            }
                                            ZStack{
                                                Circle()
                                                    .foregroundColor(Color("offGrey"))
                                                    .frame(width: 65, height: 65)
                                                Text("\(self.leaders[i].tags)")
                                                    .foregroundColor(Color("white"))
                                                    .font(.system(size: 35, weight: .bold))
                                            }
                                            Text(self.leaders[i].name)
                                                .lineLimit(1)
                                                .multilineTextAlignment(.center)
                                                .font(.footnote)
                                                .foregroundColor(Color("white"))
                                        }
                                    }
                                    .padding()
                                    .background(Color("titleGrey"))
                                    .opacity(0.6)
                                    .cornerRadius(UsefulValues.cornerRadius)
                                    .frame(width: 140, height: .infinity)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .background(Color("darkGrey"))
            .listRowSeparator(.hidden)
            .listRowBackground(Color("offBlack").opacity(0.0))
            .cornerRadius(UsefulValues.cornerRadius)
            
            HStack(){
                Text("Last Words")
                    .font(Font.title2.bold())
            }
            .listRowBackground(Color("darkGrey").opacity(0.0))
            .padding(.top)
            
            VStack{
                Section(){
                    ScrollView(.vertical, showsIndicators: false){
                        VStack{
                            ForEach(lastWords) { word in
                                VStack{
                                    HStack{
                                        Text(word.sentence)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .lineLimit(2)
                                            .foregroundColor(Color("white"))
                                        Spacer()
                                    }
                                    HStack{
                                        Spacer(minLength: 150)
                                        Text("-\(word.author)")
                                            .font(.caption)
                                            .foregroundColor(Color("offWhite"))
                                            .opacity(0.5)
                                    }
                                    .padding(.top, 5)
                                    Rectangle()
                                        .fill(Color("mediumGrey"))
                                        .frame(height: 1)
                                        .edgesIgnoringSafeArea(.horizontal)
                                }
                                .padding(.bottom)
                                .padding(.leading)
                                .padding(.trailing)
//                                .background(Color("lightGrey"))
                                .cornerRadius(UsefulValues.cornerRadius)
                                .frame(maxHeight: 100)
                                .onTapGesture{
//                                    print("clicked: \(word.sentence)")
                                    clickedSentence = word.sentence
                                    clickedAuthor = word.author
                                    isPresented.toggle()
                                }
                            }
                        }
                    }
                    .popup(isPresented: $isPresented) {
                        BottomPopupView{
                            ClickedLastWordsView(words: clickedSentence, author: clickedAuthor)
                                .task(delayText)
                        }
                    }
                    .frame(height: 200)
                }
                .frame(maxHeight: .infinity)
                .listRowBackground(Color("mediumGrey").opacity(0.0))
            }
            .padding()
            .background(Color("mediumGrey").opacity(0.0))
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            .cornerRadius(UsefulValues.cornerRadius)
        }
        .background(Color("darkestGrey"))
        .onAppear{
//            UITableView.appearance().backgroundColor = UIColor(Color("white"))
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
        db.collection("lastWords").order(by: "TimeStamp", descending: true).getDocuments() { (querySnapshot, err) in
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
//            allWords.reverse()
            self.didFetchData(data: allWords)
        }
    }

    func didFetchData(data: [Words]){
        lastWords = data
        //Do what you want
    }
    
    func pullLeaderboard(){
        let db = Firestore.firestore()
        
        db.collection("data").order(by: "tags", descending: true).getDocuments() { (querySnapshot, err) in
            var allBoard: [Leader] = []
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let firstName = document.get("firstName")
                    let lastName = document.get("lastName")
                    let name = (firstName as? String ?? "") + " " + (lastName as? String ?? "")
                    let tags = document.get("tags") as? Int ?? 0
                    let alive = document.get("alive") as? Bool
                    
                    if alive ?? false{
                        allBoard.append(Leader(name: name, tags: tags as! Int, pos: tags as! Int))
                    }
                    if allBoard.count >= 10 {
                        break
                    }
                }
                if allBoard.count < 10{
                    allBoard.append(Leader(name: "", tags: 0 as! Int, pos: 0 as! Int))
                }
            }
            self.didFetchData2(data: allBoard)
        }
    }
    func didFetchData2(data: [Leader]){
        leaders = data
    }
    private func delayText() async {
            // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
            try? await Task.sleep(nanoseconds: 4_500_000_000)
            isPresented = false
        }
}

//Preview Provider
struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
            .preferredColorScheme(.dark)
    }
}

struct OverlayModifier<OverlayView: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    let overlayView: OverlayView
    
    init(isPresented: Binding<Bool>, @ViewBuilder overlayView: @escaping () -> OverlayView) {
        self._isPresented = isPresented
        self.overlayView = overlayView()
    }
    
    func body(content: Content) -> some View {
        content.overlay(isPresented ? overlayView : nil)
    }
}

extension View {
    
    func popup<OverlayView: View>(isPresented: Binding<Bool>,
                                  blurRadius: CGFloat = 3,
                                  blurAnimation: Animation? = .linear,
                                  @ViewBuilder overlayView: @escaping () -> OverlayView) -> some View {
        return blur(radius: isPresented.wrappedValue ? blurRadius : 0)
//            .animation(blurAnimation)
            .allowsHitTesting(!isPresented.wrappedValue)
            .modifier(OverlayModifier(isPresented: isPresented, overlayView: overlayView))
    }
}
