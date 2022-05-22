//
//  ProfileView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/19/22.
//

import SwiftUI

struct ProfileView: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color("lightBlue"), Color("secondBlue")],
        startPoint: .top, endPoint: .bottom)
    
    
    var body: some View {
        VStack {
            VStack (alignment: .center){
                HStack{
                    Image("blakeProfile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                }
                HStack{
                    Text("Blake")
//                        .padding()
                        .font(.title)
                        .foregroundColor(Color("white"))
//                        .background(Color("lightPurple"))
                        .cornerRadius(20)
                }
            }
            Spacer(minLength: 50)
//            VStack(alignment: .center){
            List{
                Section(header: Text("Stats")){
                    Text("Your Target:\n YAMAN HABIP")
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.title2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(Color("white"))
                        .background(Color("pink"))
                        .cornerRadius(20)
                        
                    Text("Number of Tags: \n5")
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.title2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(Color("white"))
                        .background(Color("lightGrey"))
                        .cornerRadius(20)
                }
                .listRowBackground(Color("lightPurple"))
            }
            .onAppear {
                // Set the default to clear
                UITableView.appearance().backgroundColor = .clear
            }
//            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color("darkPurple"))
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
