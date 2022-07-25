//
//  ClickedLastWordsView.swift
//  Gotcha
//
//  Created by Blake Ankner on 7/19/22.
//

import SwiftUI

struct ClickedLastWordsView: View {
    var words: String
    var author: String
    var body: some View {
        VStack{
            Text(words)
                .foregroundColor(Color("offWhite"))
                .padding()
            HStack{
                Text("- \(author)")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(Color("lightGrey"))
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .lineLimit(3)
        .padding()
        .background(Color("darkGrey2"))
        .cornerRadius(10)
        .frame(width: .infinity, height: .infinity)
    }
}

struct ClickedLastWordsView_Previews: PreviewProvider {
    static var previews: some View {
        ClickedLastWordsView(words: "This is me testing how long i can write this and if it ", author: "Blake")
    }
}
