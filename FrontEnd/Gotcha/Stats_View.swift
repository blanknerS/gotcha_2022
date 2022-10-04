//
//  Stats_View.swift
//  Gotcha
//
//  Created by Blake Ankner on 9/30/22.
//
import SwiftUI

struct Stats_View: View {
    
    var widthModifier: Float = 7.5
    var allMonTags: Int = 510
    var allTueTags: Int = 320
    var allWedTags: Int = 275
    var allThuTags: Int = 36
    var allFriTags: Int = 50
    
    var classI_Tags: Int = 400
    var classII_Tags: Int = 35
    var classIII_Tags: Int = 20
    var classVI_Tags: Int = 2
    
    var dayMon_Tags: Int = 212
    var dayTue_Tags: Int = 49
    var dayWed_Tags: Int = 74
    var dayThu_Tags: Int = 20
    var dayFri_Tags: Int = 34
    
    var boarderMon_Tags: Int = 96
    var boarderTue_Tags: Int = 37
    var boarderWed_Tags: Int = 89
    var boarderThu_Tags: Int = 43
    var boarderFri_Tags: Int = 7
    
    var body: some View {
        List{
            HStack{ //Page Title
                Text("STATS")
                    .font(Font.title2.bold())
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            
            
            //ALL TAGS START
            HStack{
                Text("All Tags")
                    .font(Font.subheadline.bold())
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            
            VStack(alignment: .leading){ //TAG ALL
                Spacer().frame(maxWidth: .infinity)
                HStack(alignment: .bottom){
                    VStack{ //Monday
                        Text("\(allMonTags)")
                            .foregroundColor(Color("acid"))
                        Rectangle()
                            .frame(width: UIScreen.screenWidth/13, height: CGFloat(allMonTags)/4)
                            .foregroundColor(Color("acid"))
                        Text("M")
                            .font(Font.subheadline.italic())
                            .foregroundColor(Color("titleGrey"))
                    }
                    .padding()
                    VStack{ //Tuesday
                        Text("\(allTueTags)")
                            .foregroundColor(Color("rose"))
                        Rectangle()
                            .frame(width: UIScreen.screenWidth/13, height: CGFloat(allTueTags)/4)
                            .foregroundColor(Color("rose"))
                        Text("T")
                            .font(Font.subheadline.italic())
                            .foregroundColor(Color("titleGrey"))
                    }
                    .padding()
                    VStack{ //Wednesday
                        Text("\(allWedTags)")
                            .foregroundColor(Color("lavender"))
                        Rectangle()
                            .frame(width: UIScreen.screenWidth/13, height: CGFloat(allWedTags)/4)
                            .foregroundColor(Color("lavender"))
                        Text("W")
                            .font(Font.subheadline.italic())
                            .foregroundColor(Color("titleGrey"))
                    }
                    .padding()
                    VStack{ //Thursday
                        Text("\(allThuTags)")
                            .foregroundColor(Color("bubblegum"))
                        Rectangle()
                            .frame(width: UIScreen.screenWidth/13, height: CGFloat(allThuTags)/4)
                            .foregroundColor(Color("bubblegum"))
                        Text("T")
                            .font(Font.subheadline.italic())
                            .foregroundColor(Color("titleGrey"))
                    }
                    .padding()
                    VStack{ //Friday
                        Text("\(allFriTags)")
                            .foregroundColor(Color("bahama_beach"))
                        Rectangle()
                            .frame(width: UIScreen.screenWidth/13, height: CGFloat(allFriTags)/4)
                            .foregroundColor(Color("bahama_beach"))
                        Text("F")
                            .font(Font.subheadline.italic())
                            .foregroundColor(Color("titleGrey"))
                    }
                    .padding()
                }
            } //END Tag all VStack
            .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/5)
            .padding()
            .background(Color("darkGrey"))
            .cornerRadius(UsefulValues.cornerRadius)
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            .listRowInsets(EdgeInsets()) // << avoid extra space
            .listStyle(GroupedListStyle())
            //ALL TAGS END
            
            
            //CLASS TAGS START
            HStack{
                Text("Class Tags")
                    .font(Font.subheadline.bold())
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            
            HStack (alignment: .center){//EACH CLASS
                VStack{ //Class I VStack
                    HStack{
                        Text("I")
                            .font(Font.title2.bold())
                            .padding(.leading, 3)
                        Spacer()
                    }
                    Spacer()
                    Text("\(classI_Tags)")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color("titleGrey"))
                    Spacer()
                    Text("Total")
                        .font(Font.caption.italic())
                        .foregroundColor(Color("titleGrey"))
                } //END Class I VStack
                .frame(width: UIScreen.screenWidth/CGFloat(widthModifier), height: UIScreen.screenHeight/8)
                .padding()
                .background(Color("darkGrey"))
                .cornerRadius(UsefulValues.cornerRadius)
                
                VStack{ //Class III VStack
                    HStack{
                        Text("II")
                            .font(Font.title2.bold())
                            .padding(.leading, 3)
                        Spacer()
                    }
                    Spacer()
                    Text("\(classII_Tags)")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color("titleGrey"))
                    Spacer()
                    Text("Total")
                        .font(Font.caption.italic())
                        .foregroundColor(Color("titleGrey"))
                } //END Class II VStack
                .frame(width: UIScreen.screenWidth/CGFloat(widthModifier), height: UIScreen.screenHeight/8)
                .padding()
                .background(Color("darkGrey"))
                .cornerRadius(UsefulValues.cornerRadius)
                
                VStack{ //Class III VStack
                    HStack{
                        Text("III")
                            .font(Font.title2.bold())
                            .padding(.leading, 3)
                        Spacer()
                    }
                    Spacer()
                    Text("\(classIII_Tags)")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color("titleGrey"))
                    Spacer()
                    Text("Total")
                        .font(Font.caption.italic())
                        .foregroundColor(Color("titleGrey"))
                } //END Class III VStack
                .frame(width: UIScreen.screenWidth/CGFloat(widthModifier), height: UIScreen.screenHeight/8)
                .padding()
                .background(Color("darkGrey"))
                .cornerRadius(UsefulValues.cornerRadius)
                
                VStack{ // Class VI VStack
                    HStack{
                        Text("VI")
                            .font(Font.title2.bold())
                            .padding(.leading, 3)
                        Spacer()
                    }
                    Spacer()
                    Text("\(classVI_Tags)")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color("titleGrey"))
                    Spacer()
                    Text("Total")
                        .font(Font.caption.italic())
                        .foregroundColor(Color("titleGrey"))
                } //END Class VI VStack
                .frame(width: UIScreen.screenWidth/CGFloat(widthModifier), height: UIScreen.screenHeight/8)
                .padding()
                .background(Color("darkGrey"))
                .cornerRadius(UsefulValues.cornerRadius)
            } //END Each Class Section
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            .listRowInsets(EdgeInsets()) // << avoid extra space
            .listStyle(GroupedListStyle())
            //CLASS TAGS START
            
            
            //DAY v. BOARDER START
            HStack{
                Text("Day v. Boarder")
                    .font(Font.subheadline.bold())
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            HStack{ //DAY v. BOARDER
                VStack{ //Day
                    VStack{
                        Spacer().frame(maxWidth: .infinity)
                        HStack(alignment: .bottom){
                            VStack{ //Monday
                                Text("\(dayMon_Tags)")
                                    .font(Font.caption.bold())
                                    .foregroundColor(Color("acid"))
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(dayMon_Tags)/6)
                                    .foregroundColor(Color("acid"))
                                Text("M")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Tuesday
                                Text("\(dayTue_Tags)")
                                    .foregroundColor(Color("rose"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(dayTue_Tags)/6)
                                    .foregroundColor(Color("rose"))
                                Text("T")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Wednesday
                                Text("\(dayWed_Tags)")
                                    .foregroundColor(Color("lavender"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(dayWed_Tags)/6)
                                    .foregroundColor(Color("lavender"))
                                Text("W")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Thursday
                                Text("\(dayThu_Tags)")
                                    .foregroundColor(Color("bubblegum"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(dayThu_Tags)/6)
                                    .foregroundColor(Color("bubblegum"))
                                Text("T")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Friday
                                Text("\(dayFri_Tags)")
                                    .foregroundColor(Color("bahama_beach"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(dayFri_Tags)/6)
                                    .foregroundColor(Color("bahama_beach"))
                                Text("F")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                        }
                        Spacer()
                        Text("Day")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(Color("titleGrey"))
                    }
                    .frame(width: UIScreen.screenWidth/2.8, height: UIScreen.screenHeight/6)
                    .padding()
                    .background(Color("darkGrey"))
                } //END Day VStack
                .cornerRadius(UsefulValues.cornerRadius)
                
                VStack{ // Boarder
                    VStack{
                        Spacer().frame(maxWidth: .infinity)
                        HStack(alignment: .bottom){
                            VStack{ //Monday
                                Text("\(boarderMon_Tags)")
                                    .font(Font.caption.bold())
                                    .foregroundColor(Color("acid"))
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(boarderMon_Tags)/6)
                                    .foregroundColor(Color("acid"))
                                Text("M")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Tuesday
                                Text("\(boarderTue_Tags)")
                                    .foregroundColor(Color("rose"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(boarderTue_Tags)/6)
                                    .foregroundColor(Color("rose"))
                                Text("T")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Wednesday
                                Text("\(boarderWed_Tags)")
                                    .foregroundColor(Color("lavender"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(boarderWed_Tags)/6)
                                    .foregroundColor(Color("lavender"))
                                Text("W")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Thursday
                                Text("\(boarderThu_Tags)")
                                    .foregroundColor(Color("bubblegum"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(boarderThu_Tags)/6)
                                    .foregroundColor(Color("bubblegum"))
                                Text("T")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Friday
                                Text("\(boarderFri_Tags)")
                                    .foregroundColor(Color("bahama_beach"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(boarderFri_Tags)/6)
                                    .foregroundColor(Color("bahama_beach"))
                                Text("F")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                        }
                        Spacer()
                        Text("Boarder")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(Color("titleGrey"))
                    }
                    .frame(width: UIScreen.screenWidth/2.8, height: UIScreen.screenHeight/6)
                    .padding()
                    .background(Color("darkGrey"))
                } // END Boarder VStack
                .cornerRadius(UsefulValues.cornerRadius)
            } // END DAY v. BOARDER Section
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            .listRowInsets(EdgeInsets()) // << avoid extra space
            .listStyle(GroupedListStyle())
            //DAY v. BOARDER END
            
            
            
        } //END List
        .background(Color("darkestGrey"))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(){
            UITableView.appearance().backgroundColor = UIColor(Color("darkestGrey")) //change View Backgrounnd
            
        }
    }
}

struct Stats_View_Previews: PreviewProvider {
    static var previews: some View {
        Stats_View()
            .preferredColorScheme(.dark)
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
