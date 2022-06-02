//
//  ProfileView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/19/22.
//

import SwiftUI
import FirebaseFirestore

struct ProfileView: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color("lightBlue"), Color("secondBlue")],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        List{
            Section(){
                VStack {
                    VStack(alignment: .leading){
                        Label("Profile", systemImage: "person.circle.fill")
                            .foregroundColor(Color("lightGrey"))
                    }
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
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
//                    Spacer(minLength: 50)
                    VStack{
                        Text("🎯 YAMAN HABIP")
                            .fixedSize()
                            .multilineTextAlignment(.center)
//                            .padding()
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(Color("lightGrey"))
    //                        .background(Color("offGrey"))
                            .cornerRadius(20)
//                            .shadow(color: Color("darkRed"), radius: 4, x: 4, y: 4)
                        
                        Text("#️⃣ 5 tags")
                            .multilineTextAlignment(.center)
                            .fixedSize()
//                            .padding()
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(Color("lightGrey"))
    //                        .background(Color("offGrey"))
                            .cornerRadius(20)
//                            .shadow(color: Color("darkBlue"), radius: 4, x: 4, y: 4)
                        
        //                .shadow(color: .white, radius: 2, x: 2, y: 2)
                    }
    //
                }
//                .padding()
            }
            .padding()
//            I WANTED HEXAGON BUTTON BUT IDC ENOUGH ANYMORRE
            Section(){
                VStack{
                    VStack(alignment: .leading){
                        Label("Tag Out", systemImage: "xmark.seal.fill")
                            .foregroundColor(Color("lightGrey"))
                    }
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                HalvedCircularBar()
                        .padding()
                }
            }
            .padding(.top ,15)
            .padding(.leading ,15)
        }
    }
}

struct HalvedCircularBar: View {
    
    @State var started: Bool = false
    @State var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(Color("lightGrey"), style: StrokeStyle(lineWidth: 12.0, dash: [8]))
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: -180))
                Circle()
                    .trim(from: 0.0, to: progress/2)
                    .stroke(Color("darkRed"), lineWidth: 12.0)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: -180))
                Text("\(Int(self.progress*100))%")
                    .font(.title3)
                    .foregroundColor(Color("lightGrey"))
            }
            HStack{
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                Text("CLICK")
                    .onLongPressGesture{
                        impactMed.impactOccurred()
                        started.toggle()
                        self.startLoading()}
                Text("STOP")
                    .onTapGesture {
                        impactMed.impactOccurred()
                        started = false
                        self.progress = 0
                    }
            }
//            .offset(y: -30)
        }
    }
    
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                if started{
                    self.progress += 0.01
                    if self.progress >= 1.0 {
                        timer.invalidate()
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
