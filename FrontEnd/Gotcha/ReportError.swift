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
        ZStack{
            Color("mediumGrey")
                .padding(-10)
                .frame(width: .infinity, height: 150)
                .ignoresSafeArea()
                .cornerRadius(20)
            
            VStack {
                Text("What can we help you with:")
                    .offset(y:5)
                ZStack{
                    TextField(
                        "Problem",
                        text: $givenName
                    )
                    .padding()
                    .disableAutocorrection(true)
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
//            .padding()
            .frame(width: .infinity, height: 60, alignment: .center)
            .textFieldStyle(.roundedBorder)
//            .background(Color("darkGrey"))
    //        .cornerRadius(20)
        }
//        .frame(width: .infinity, height: 100)
        .padding()
    }
}

//struct ReportError_Previews: PreviewProvider {
//    static var previews: some View {
//        ReportError()
//    }
//}
