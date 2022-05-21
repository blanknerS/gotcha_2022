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
    
    //populate this list with Leaders in the given format
    
    var leaders: [Leader] = [
        
        Leader(name: "Player1", tags: "1"),
        Leader(name: "Player2", tags: "2"),
        Leader(name: "Player3", tags: "3"),
        Leader(name: "Player4", tags: "4")
        
    ]
    
    @State private var ids = Set<UUID>()

    var body: some View {
        
        List(leaders, selection: $ids) {
                
                Text($0.name + $0.tags)

        }
        .padding()
        .background(backgroundGradient)
    }
}
        


struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
            .preferredColorScheme(.dark)
    }
}
