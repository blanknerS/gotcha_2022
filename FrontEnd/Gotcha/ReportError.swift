//
//  ReportError.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/22/22.
//

import SwiftUI

struct ReportError: View {
    @State private var givenName: String = ""
    @State private var familyName: String = ""
    @Binding var showPopUp: Bool

    var body: some View {
        VStack {
            Text("What can we help you with:")
            ZStack{
                TextField(
                    "Problem",
                    text: $givenName
                )
                .disableAutocorrection(true)
                .frame(height: 55)
            }
            Button("Send"){
                print("Send: \(givenName)")
                showPopUp.toggle()
                givenName = ""
            }
//            TextField(
//                "Family Name",
//                text: $familyName
//            )
//            .disableAutocorrection(true)
        }
        .frame(width: 300, height: 30, alignment: .center)
        .textFieldStyle(.roundedBorder)
    }
}

//struct ReportError_Previews: PreviewProvider {
//    static var previews: some View {
//        ReportError()
//    }
//}
